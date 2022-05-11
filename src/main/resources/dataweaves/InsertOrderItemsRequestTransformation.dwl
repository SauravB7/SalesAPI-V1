%dw 2.0
output application/json
---

{
    orderItems: vars.originalPayload.orders map ((order, indexOfOrder) -> {
        orderId: order.orderId,
        items: order.orderItems map ((item, indexOfItem) -> {
            productId: item.itemId,
            itemQty: item.quantity,
            sellerId: item.sellerId,
            shippingLimitDate: item.shippingLimitDate,
            pricePerItem: item.pricePerItem,
            freightValue: item.freightValue
        })
    })
}