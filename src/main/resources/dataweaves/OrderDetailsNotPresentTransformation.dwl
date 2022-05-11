%dw 2.0
output application/java
---
{
	orderId: payload,
	status: "Error",
	message: "Order details not present in Database"
}