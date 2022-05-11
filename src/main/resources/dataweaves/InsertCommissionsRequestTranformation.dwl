%dw 2.0
import modules::Orders

output application/json
---
{
    commissions: vars.originalPayload.orders map ((order, indexOfOrder) -> {
        orderId: order.orderId,
        regionCd: order.regionCd,
        orderValue: if(isEmpty(order.orderValue)) Orders::calculateOrderValue(order.orderItems) as String {format: "0.00"} as Number else order.orderValue,
        commissionAmount: (if((not isEmpty(order.orderValue)) and (not isEmpty(order.productValue))) Orders::calculateCommission(order.orderValue, (order.orderValue - order.productValue), order.regionCd, p('commissions')) else Orders::calculateCommissionValue(order.orderItems, order.regionCd, p('commissions'))) as String {format: "0.00"} as Number
    })
}