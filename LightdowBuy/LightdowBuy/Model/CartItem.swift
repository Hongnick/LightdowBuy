

import Foundation
struct CartItem: Equatable , Codable {
    var itemImageUrl: String
    var itemName: String


    var itemQuantity: String
    var itemPrice: String
    var subtotal: String
//
   var cartID : String = UUID().uuidString
 

    
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        if lhs.itemImageUrl == rhs.itemImageUrl && lhs.itemName == rhs.itemName && lhs.itemPrice == rhs.itemPrice {
            return true
        }else{
            return false
        }
    }
}

