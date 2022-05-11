%dw 2.0
import * from dw::core::Arrays

fun calculateOrderValue(orderItems) = sumBy(orderItems, (item) -> ((item.quantity as Number) * (item.pricePerItem as Number)))
fun calculateFrieghtValue (orderItems) = sumBy(orderItems, (item) -> ((item.quantity as Number) * (item.freightValue as Number)))
fun calculateProductValue (orderItems) = sumBy(orderItems, (item) -> ((item.quantity as Number) * (item.productValue as Number)))


fun calculateTotalVal(orderItems) = (sumBy(orderItems, (item) -> ((item.itemQty as Number) * (item.pricePerItem as Number)))) default 0
fun calculateFrieghtVal (orderItems) = (sumBy(orderItems, (item) -> ((item.itemQty as Number) * (item.freightValue as Number)))) default 0
fun calculateItemVal (orderItems) = calculateTotalVal(orderItems) - calculateFrieghtVal(orderItems)

fun calculateProfit(orderItems) = calculateOrderValue(orderItems) - calculateFrieghtValue(orderItems) - calculateProductValue(orderItems)
fun profitOrRevenue(commissions, areaCode) = if(commissions.revenue[areaCode]?) "revenue" else if(commissions.profit[areaCode]?) "profit" else null

fun convertCommissionToObj(commissions) = ({(commissions splitBy(";") map ((item, index) -> {
    (trim((item splitBy("="))[0])): (item splitBy("="))[1]
}))} mapObject ((value, key, index1) -> {
    (key):
        {((value splitBy (",")) map ((region, index2) -> {
            ((region splitBy (":"))[0]): (region splitBy (":"))[1]
        }))}
}))

fun calculateCommissionValue(orderItems, areaCode, commissions) = if(not isEmpty(profitOrRevenue(convertCommissionToObj(commissions), areaCode))) (if(profitOrRevenue(convertCommissionToObj(commissions), areaCode) == 'revenue') (calculateOrderValue(orderItems) * ((convertCommissionToObj(commissions).revenue[areaCode]) / 100)) else (calculateProfit(orderItems) * ((convertCommissionToObj(commissions).profit[areaCode]) / 100))) else 0
fun calculateCommission(revenue, profit, areaCode, commissions) = if(not isEmpty(profitOrRevenue(convertCommissionToObj(commissions), areaCode))) (if(profitOrRevenue(convertCommissionToObj(commissions), areaCode) == 'revenue') (revenue * ((convertCommissionToObj(commissions).revenue[areaCode]) / 100)) else (profit * ((convertCommissionToObj(commissions).profit[areaCode]) / 100))) else 0