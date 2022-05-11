%dw 2.0
output application/json
---
{
    "transactionNotification": {
        "transactionCode": "E",
        "transactionStatus": "Error",
        "remarks": [{
                "messageCode": "UAP-APP-405",
                "messageText": "Method Not Allowed."
            }
        ]
    }
}