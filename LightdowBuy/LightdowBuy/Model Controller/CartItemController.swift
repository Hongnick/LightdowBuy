

import Foundation
struct CartItemController {
    static let shared = CartItemController()
    
  
    
    
    
    
    
    func newCartItem(with product: Product, quantity: String) -> CartItem {
        let itemImageUrl = product.imageUrl
        let itemName = product.productName
        let itemPrice = product.productPrice
     //   let itemColor = chosenColor
        var subtotal = 0
        if let itemPrice = Int(product.productPrice), let itemQuantity = Int(quantity) {
            subtotal = itemPrice * itemQuantity
        }
     //   let itemSize = ProductController.shared.getProductSize(with: chosenIndex)

        let cartItem = CartItem(itemImageUrl: itemImageUrl, itemName: itemName, itemQuantity: quantity, itemPrice: itemPrice, subtotal: String(subtotal))

        return cartItem
    }
//
}
