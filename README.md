# DB-Final
Final Project for CSCI-GA.2433 Database Systems at NYU

## Demo of Insurance Quote Dashboard
![Alt text](chat_demo.gif)

## Start server
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