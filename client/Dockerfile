FROM python:3.8.5

ENV DASH_DEBUG_MODE True

RUN apt install -y

RUN pip install Brotli==1.0.7
RUN pip install certifi==2020.6.20
RUN pip install chardet==3.0.4
RUN pip install click==7.1.2
RUN pip install dash==1.13.4
RUN pip install dash-bootstrap-components==0.10.3
RUN pip install dash-core-components==1.10.1
RUN pip install dash-html-components==1.0.3
RUN pip install dash-renderer==1.5.1
RUN pip install dash-table==4.8.1
RUN pip install filelock==3.0.12
RUN pip install Flask==1.1.2
RUN pip install Flask-Compress==1.5.0
RUN pip install future==0.18.2
RUN pip install gunicorn==20.0.4
RUN pip install idna==2.9
RUN pip install itsdangerous==1.1.0
RUN pip install Jinja2==2.11.2
RUN pip install joblib==0.15.1
RUN pip install MarkupSafe==1.1.1
RUN pip install numpy==1.19.0
RUN pip install packaging==20.4
RUN pip install plotly==4.8.1
RUN pip install pyparsing==2.4.7
RUN pip install regex==2020.6.8
RUN pip install requests==2.24.0
RUN pip install retrying==1.3.3
RUN pip install sacremoses==0.0.43
RUN pip install sentencepiece==0.1.91
RUN pip install six==1.15.0
RUN pip install tokenizers==0.7.0
RUN pip install torch==1.5.1
RUN pip install tqdm==4.46.1
RUN pip install urllib3==1.25.9
RUN pip install Werkzeug==1.0.1

RUN pip install tensorflow>=2.4.0
RUN pip install transformers>=3.2.0
RUN pip install tensorflow-addons>=0.11.2
RUN pip install tensorflow-hub>=0.9.0
RUN pip install seqeval>=0.0.17
RUN pip install scikit-learn>=0.23.2
RUN pip install matplotlib>=3.3.2

RUN pip install dnspython==2.0.0
RUN pip install pymongo

RUN pip install spacy

EXPOSE 8050

CMD ["python", "index.py"]