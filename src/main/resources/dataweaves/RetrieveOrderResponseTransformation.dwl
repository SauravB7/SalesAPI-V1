%dw 2.0
import modules::Orders

output application/json
---
{
    "orderId": payload,
    "customerId": vars.orderDetails.order.customerId,
    "orderStatus": vars.orderDetails.order.orderStatus,
    "purchaseTimestamp": vars.orderDetails.order.purchaseTimestamp,
    "approvedAt": vars.orderDetails.order.approvedAt,
    "deliveredCarrierDate": vars.orderDetails.order.deliveredCarrierDate,
    "deliveredCustomerDate": vars.orderDetails.order.deliveredCustomerDate,
    "estimatedDelivery": vars.orderDetails.order.estimatedDelivery,
    "orderItems": if(not isEmpty(vars.orderItems.orderItems.items)) (vars.orderItems.orderItems.items map (item, indexOfItem) -> ({
        "itemId": item.productId,
        "quantity": item.itemQty,
        "pricePerItem": item.pricePerItem,
        "freightValue": item.freightValue,
        "sellerId": item.sellerId,
        "shippingLimitDate": item.shippingLimitDate
    })) else null,
    "orderValue": if(not isEmpty(vars.orderItems.orderItems.items)) ({
        "totalItemValue": Orders::calculateItemVal(vars.orderItems.orderItems.items),
        "totalFreightValue": Orders::calculateFrieghtVal(vars.orderItems.orderItems.items),
        "totalOrderValue": Orders::calculateTotalVal(vars.orderItems.orderItems.items)
    }) else null,
    "commissionDetails": if(not isEmpty(vars.commissionDetails.commission)) ({
        "regionCd": vars.commissionDetails.commission.regionCd,
        "orderValue": vars.commissionDetails.commission.orderValue,
        "commissionValue": vars.commissionDetails.commission.commissionAmount
    }) else null
}