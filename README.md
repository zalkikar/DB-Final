# DB-Final
Final Project for CSCI-GA.2433 Database Systems at NYU

## Models
1-epoch, proof of concept NLU model can be found here: https://drive.google.com/drive/folders/1Dbpe3yf2vn1Ig3pNhfkR_SnDVUD4Fnw3?usp=sharing

drop /saved_models in /client/app

## Demo of Insurance Quote Dashboard
![Alt text](chat_demo.gif)

## Start Rust server
Install Rust with rustup: ```curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh```

Then:

``` cargo build ```

``` cargo run ```

For example, send GET request (empty body) to:
```http://127.0.0.1:8000/genmodelins/123456788```
You will get response:
```javascript
{
    "Age": 22,
    "Gender": "0",
    "Weight": 145,
    "Height": 69,
    "City": 0,
    "Country": 0,
    "SmokingHabits": 1,
    "CancerHistory": 1,
    "CardiovascularHistory": 1,
    "DrinkingHabits": null,
    "ActivityHabits": null
}
```

## Start Client
Install Docker, increase memory to 6GB.

Then:

``` docker build -t rz-insurancedashboard . ```

``` docker-compose up -d ```

``` docker logs rz-insurancedashboard-dev ``` to check logs

``` docker stop rz-insurancedashboard-dev ``` to stop container
