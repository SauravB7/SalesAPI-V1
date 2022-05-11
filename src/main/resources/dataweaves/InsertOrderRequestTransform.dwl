%dw 2.0
import modules::Orders
output application/json
---
if(not isEmpty(payload))
{
	"orders": payload map (order, indexOfOrder) -> {
		"orderId": order.orderId,
		"customerId": order.customerId,
		"orderStatus": order.orderStatus,
		"purchaseTimestamp": order.purchaseTimestamp,
		"approvedAt": order.approvedAt,
		"deliveredCarrierDate": order.deliveredCarrierDate,
		"deliveredCustomerDate": order.deliveredCustomerDate,
		"estimatedDelivery": order.estimatedDelivery,
		"orderValue": if(isEmpty(order.orderValue)) Orders::calculateOrderValue(order.orderItems) else order.orderValue,
		"regionCd": order.regionCd
	}
}
else null