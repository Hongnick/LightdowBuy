

import Foundation

/* 如果需更改購物車內容的controller，
   只要呼叫CartManager的updateQuantityAndSubtotal跟remove的function，
   在用completion拿到的newCart去reloadData，同時也更新了CartManager的購物車內容

*/
struct CartManager{
    static var shared = CartManager(shoppingcart: [CartItem]())
    var shoppingcart:[CartItem]
    
    // 更新數量
    mutating func updateQuantityAndSubtotal(of cartItem: CartItem, with newQuantity: Int, and subtotal: String, with completion: @escaping ([CartItem]?) -> Void) {
        guard let cartItemIndex = shoppingcart.firstIndex(of: cartItem) else {return}
        shoppingcart[cartItemIndex].itemQuantity = String(newQuantity)
        shoppingcart[cartItemIndex].subtotal = subtotal
        completion(shoppingcart)

    }
    // 刪除
    mutating func remove(cartItem: CartItem, completion: @escaping ([CartItem]?) -> Void){
        guard let cartItemIndex = shoppingcart.firstIndex(of: cartItem) else {return}
        shoppingcart.remove(at: cartItemIndex)
        completion(shoppingcart)
    }
    
    // 總計
    func getTotal() -> String?{
        var total = 0
        for cartItem in shoppingcart {
            guard let quantity = Int(cartItem.itemQuantity), let price = Int(cartItem.itemPrice) else {return nil}
            total += Int(quantity * price)
        }
        return String(total)
    }
}
