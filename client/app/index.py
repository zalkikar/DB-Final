import dash
import dash_html_components as html
import dash_core_components as dcc
import dash_bootstrap_components as dbc
from dash.dependencies import Input, Output, State

from transformers import AutoModelWithLMHead, AutoTokenizer

import os
import time
import torch
import flask
import logging
import requests

from dialognlu import BertNLU, AutoNLU
from dialognlu.readers.goo_format_reader import Reader
import json

from mongodb import Database

from spacy.lang.en import English

MODEL_NAME = 'joint_albert_model_disease_v1'
APP_LOG = "./config/app.log"

INTENTS_INTERNAL_SESSION = []
SLOTS_INTERNAL_SESSION = []

# spacy tokenizer with the default settings for English including punctuation rules and exceptions
spacy_tokenizer = English().tokenizer

nlu = AutoNLU.load(f'./saved_models/{MODEL_NAME}')

logging.basicConfig(filename=APP_LOG,
                    filemode='w',
                    format='%(asctime)s - %(message)s',
                    level=logging.DEBUG)

stylesheets = [dbc.themes.BOOTSTRAP]
server = flask.Flask(__name__)
app = dash.Dash(__name__, server=server, external_stylesheets=stylesheets, suppress_callback_exceptions = True)

device = "cuda" if torch.cuda.is_available() else "cpu"

name = "microsoft/DialoGPT-medium"
tokenizer = AutoTokenizer.from_pretrained(name)
model = AutoModelWithLMHead.from_pretrained(name)
if device == "cuda": # Switch to cuda, eval mode, and FP16 for faster inference
    model = model.half()
model.to(device)
model.eval()



def get_bmi(lbs:int, height:int):
    return (((lbs / height) / height) * 703 )

def adjust_quote_bmi(bmi:float):
    # arbitrary quote adjustments for proof of concept via BMI
    if bmi <= 18.5: #A BMI of less than 18.5 means that a person is underweight.
        return 15
    elif bmi <= 24.9: #A BMI of between 18.5 and 24.9 is ideal.
        return -10
    elif bmi <= 29.9: #A BMI of between 25 and 29.9 is overweight.
        return 10
    elif bmi > 29.9: #A BMI over 30 indicates obesity
        return 20

def adjust_quote_chats(intents:list, slots:list):
    # arbitrary quote adjustments for proof of concept via Natural Language Understanding to capture disease potential
    #sign_illness_cnt = intents.count('sign_illness')
    depressed_slot_cnt = slots.count("depressed_mood")
    anxiety_slot_cnt = slots.count("anxiety")

    return ((1.5 * anxiety_slot_cnt) + (2 * depressed_slot_cnt))

# --- Helper Functions --- #

def textbox(text, box="other"):
    style = {
        "max-width": "55%",
        "width": "max-content",
        "padding": "10px 15px",
        "border-radius": "25px",
    }

    if box == "self":
        style["margin-left"] = "auto"
        style["margin-right"] = 0

        color = "primary"
        inverse = True

    elif box == "other":
        style["margin-left"] = 0
        style["margin-right"] = "auto"

        color = "light"
        inverse = False

    else:
        raise ValueError("Incorrect option for `box`.")

    return dbc.Card(text, style=style, body=True, color=color, inverse=inverse)


def check_customer(cust_ssn):
    PARAMS = {} # defining a params dict for the parameters to be sent to the API
    URL = f"http://host.docker.internal:8000/customers/{int(cust_ssn)}" # api endpoint url
    r = requests.get(url = URL, params = PARAMS) # sending get request and saving the response as response object
    if r.status_code == 404: # server cant find resource
        return False, ""
    else:
        cust_d = r.json() # extracting data in json format
        print(cust_d)
        return True, cust_d['CustAliasSalutation']

def check_product(prod):
    PARAMS = {} # defining a params dict for the parameters to be sent to the API
    URL = f"http://host.docker.internal:8000/products/{prod}" # api endpoint url
    r = requests.get(url = URL, params = PARAMS) # sending get request and saving the response as response object
    if r.status_code == 404: # server cant find resource
        return False
    else:
        prod_d = r.json() # extracting data in json format
        print(prod_d)
        return True

def query_customer(cust_ssn):
    PARAMS = {} # defining a params dict for the parameters to be sent to the API
    URL = f"http://host.docker.internal:8000/customers/{int(cust_ssn)}" # api endpoint url
    r = requests.get(url = URL, params = PARAMS) # sending get request and saving the response as response object
    cust_d = r.json() # extracting data in json format
    return cust_d

def query_genmodel(cust_ssn):
    PARAMS = {} # defining a params dict for the parameters to be sent to the API
    URL = f"http://host.docker.internal:8000/genmodelins/{int(cust_ssn)}" # api endpoint url
    r = requests.get(url = URL, params = PARAMS) # sending get request and saving the response as response object
    genmodel_d = r.json() # extracting data in json format
    return genmodel_d


# --- Layouts --- #

quote = html.Div(
    id="display-quote"
)

conversation = html.Div(
    style={
        "width": "80%",
        "max-width": "800px",
        "height": "60vh",
        "margin": "auto",
        "overflow-y": "auto",
    },
    id="display-conversation",
)

controls = dbc.InputGroup(
    style={"width": "80%", "max-width": "800px", "margin": "auto"},
    children=[
        dbc.Input(id="user-input", placeholder="Write something... type 'clear' to clear the chat!", type="text"),
        dbc.InputGroupAddon(dbc.Button("Submit", id="submit"), addon_type="append",),
    ],
)


loading_spinner = html.Div(
    [
        dbc.Spinner(html.Div(id="loading-output")),
    ]
)

customer_form = dbc.Col(dbc.FormGroup(
            [
                dbc.Input(id="customer-input", placeholder="Enter your SSN", type='password', value = ""),
                dbc.FormFeedback("Valid customer ssn, records found", valid=True),
                dbc.FormFeedback( "Sorry, your records couldn't be found (hint: try '123456789')", valid=False),
            ],
            className="mr-3",
        ),
        width=4,
)


product_menu = html.Div(id = "product-menu",
                        style={'margin-left': '15px'})

account_infos = html.Div(id="account-infos",
                         style={'margin-right': '50px'})

profile_info = html.Div(id="profile-info")




# Define Layout
app.layout = dbc.Container(
    fluid=True,
    children=[
        html.H5("Insurance Quote Portal", style={'margin-top':'5px'}),
        dbc.Row([
            dbc.Col([
                customer_form,
                product_menu,
                dcc.Store(id="store-quote", data="100"),
                quote,
            ]),
            profile_info,
            account_infos,
        ]),
        loading_spinner
    ],
)



# --- Callbacks --- #

# dependent profile info
# {'Age': 22, 'Gender': '0', 'Weight': 145, 'Height': 69, 'City': 0, 'Country': 0, 'SmokingHabits': 1, 'CancerHistory': 1, 'CardiovascularHistory': 1, 'DrinkingHabits': None, 'ActivityHabits': None}
@app.callback(Output('profile-info','children'),
              [Input('customer-input','value'), Input('customer-input','valid')],
              [State("store-quote", "data")])
def load_profile_info(cust_ssn, valid_cust, quote_history):
    if valid_cust:
        gender_map = {'1':"Male", '0':"Female"}
        genmodel_info = query_genmodel(cust_ssn)
        p_content = ""
        if genmodel_info['Age']: p_content += f"Age: {genmodel_info['Age']} years\n"
        else: p_content += "Age: Unknown\n"
        if genmodel_info['Gender']: p_content += f"Gender: {gender_map[genmodel_info['Gender']]}\n"
        else: p_content += "Gender: Unknown\n"

        r_content = ""
        if genmodel_info['Weight']: r_content += f"Weight: {genmodel_info['Weight']}lbs.\n"
        else: r_content += "Weight: Unknown\n"
        if genmodel_info['Height']: r_content += f"Height: {genmodel_info['Height']}in.\n"
        else: r_content += "Height: Unknown\n"

        if genmodel_info['Weight'] and genmodel_info['Height']:
            bmi = get_bmi(float(genmodel_info['Weight']), float(genmodel_info['Height']))
            quote_history = str(float(quote_history) + adjust_quote_bmi(bmi))

        return dbc.Col([
                    dbc.Card(
                            dbc.CardBody(
                                    [
                                        html.H5("Your Profile", style={'fontSize': 13}),
                                        html.P(p_content, style={'fontSize': 11})
                                    ]
                                ),
                        style={"width": "9rem", 'whiteSpace': 'pre-wrap', "height":"5rem"}
                    ),
                    dbc.Card(
                            dbc.CardBody(
                                    [
                                        html.H5("Your Records", style={'fontSize': 13}),
                                        html.P( r_content, style={'fontSize': 11})
                                    ]
                                ),
                        style={"width": "9rem", 'whiteSpace': 'pre-wrap', "height":"9rem"}
                    )], style={'margin-right': '5px'})



# dependent account info
@app.callback(Output('account-infos','children'),
              [Input('customer-input','value'),
               Input('customer-input','valid')])
def load_account_options(cust_ssn, valid_cust):
    if valid_cust:
        cust_info = query_customer(cust_ssn) # we should know customer exists at this point
        children = []
        for acc in cust_info['accounts']:
            children.append(dbc.Card(
                                dbc.CardBody(
                                    [
                                        html.H5(f"{acc['AccountName']}", style={'fontSize': 13}),
                                        html.P(
                                            f"ID: {acc['AccountID']}\nType: {acc['Type']}\nStart Date: {acc['StartDate']}",
                                            style={'fontSize': 11},
                                        ),
                                        dbc.CardLink("Details", href="#", style={'fontSize': 13}),
                                    ]
                                ),
                                style={"width": "9rem", 'whiteSpace': 'pre-wrap', "height":"14rem"}
                                ))
        return dbc.Row(children)


# dependent add product info
@app.callback(Output('product-menu','children'),
              [Input('customer-input','valid')])
def load_product_options(valid_cust):
    if valid_cust:
        return html.Div(
            [
                dcc.Dropdown(
                    id="product-input",
                    options=[{'label':"life insurance", 'value':"life insurance"}],
                    value ="",
                    placeholder="Select product to add",
                    style = {"width": "54%", "display":'inline-block', "max-width": "800px"}
                )
            ],
        )


@app.callback(
    Output("loading-output", "children"),
    [Input("customer-input", "name"),
     Input("customer-input", "valid"),
     Input("product-input", "value")]
)
def load_output(cust, valid_cust, prod):#, valid_prod):
    if valid_cust and prod: #and valid_prod:
        time.sleep(1)
        return dbc.Container(
                fluid=True,
                children=[
                    html.H5(f"Hi {cust}, before you get your {prod} quote, let's chat about how you're feeling right now.", style={'fontSize': 14}),
                    html.Hr(),
                    dcc.Store(id="store-conversation", data=""),
                    conversation,
                    controls,
                ])


@app.callback(
    [Output("customer-input", "valid"), Output("customer-input", "invalid"), Output("customer-input", "name")],
    [Input("customer-input", "value")]
)
def check_customer_validity(customer_ssn):
    if customer_ssn:
        is_cust, name = check_customer(customer_ssn)
        return is_cust, not is_cust, name
    return False, False, ""


@app.callback(
    Output("display-conversation", "children"),
    [Input("store-conversation", "data")]
)
def update_display(chat_history):
    return [
        textbox(x, box="self") if i % 2 == 0 else textbox(x, box="other")
        for i, x in enumerate(chat_history.split(tokenizer.eos_token)[:-1])
    ]


@app.callback(
    Output("display-quote", "children"),
    [Input("store-quote", "data")]
)
def update_quote_display(quote_history):
    return html.H5(f"Real-Time Quote : {quote_history}", style={'fontSize': 15, 'margin-left':'15px'})



@app.callback(
    [Output("store-quote", "data"), Output("store-conversation", "data"), Output("user-input", "value")],
    [Input("customer-input", "value"), Input("submit", "n_clicks"), Input("user-input", "n_submit")],
    [State("user-input", "value"), State("store-conversation", "data"), State("store-quote","data")],
)
def run_chatbot(customer_ssn, n_clicks, n_submit, user_input, chat_history, quote_history):

    if n_clicks == 0:
        return "", "", ""

    if user_input is None or user_input == "": #or user_input.lower() == "exit":
        return quote_history, chat_history, ""

    if user_input.lower() == "clear":
        logging.info(f"Clearing Chat History")
        chat_history = ""
        quote_history = "100"
        return quote_history, chat_history, ""

    INTENTS_INTERNAL_SESSION = []
    SLOTS_INTERNAL_SESSION = []

    processed_user_input = " ".join([t.text for t in spacy_tokenizer(user_input.lower())])
    processed_user_input = processed_user_input.strip()
    nlu_out = nlu.predict(processed_user_input)

    INTENTS_INTERNAL_SESSION.append(nlu_out['intent']['name'])
    SLOTS_INTERNAL_SESSION.extend([entry['slot'] for entry in nlu_out['slots']])
    quote_history = str(float(quote_history) + adjust_quote_chats(INTENTS_INTERNAL_SESSION, SLOTS_INTERNAL_SESSION))

    cust_chat_data = {'CustSSN':customer_ssn,
                      'CustUtteranceRaw':user_input,
                      'CustUtteranceProcessed':processed_user_input,
                      'Model':MODEL_NAME,
                      'ModelOut':nlu_out
                      }
    """ # need creds
    with Database() as dbinstance:
        dbinstance.insert_chat(cust_chat_data)
    logging.info(f"Stored chat in MongoDB")
    """

    bot_input_ids = tokenizer.encode(
        chat_history + user_input + tokenizer.eos_token, return_tensors="pt"
    ).to(device)

    chat_history_ids = model.generate(
        bot_input_ids, max_length=1024, pad_token_id=tokenizer.eos_token_id
    )
    chat_history = tokenizer.decode(chat_history_ids[0]) # total chat history is limited to 1k tokens

    return quote_history, chat_history, ""


if __name__ == "__main__":
    # for now just flask app
    debug = False if os.environ["DASH_DEBUG_MODE"] == "False" else True
    app.run_server(host="0.0.0.0", port=8050, debug=debug)
    #for deploying we add a WSGI server (fastAPI) infront of flask app
    #from fastapi import FastAPI
    #from starlette.middleware.wsgi import WSGIMiddleware
    #server = FastAPI()
    #server.mount("/dash", WSGIMiddleware(app.server))
    #uvicorn.run(server)
