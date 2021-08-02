

import Foundation
struct CartItem: Equatable , Codable {
    var itemImageUrl: String
    var itemName: String


    var itemQuantity: String
    var itemPrice: String
    var subtotal: String
//
   var cartID : String = UUID().uuidString
//     init() {
//        self.cartID = UUID().uuidString
//    }

    
//    // Cart物件寫到檔案：Dictionary
//    func encode(with coder: NSCoder)  {
//        coder.encode(self.cartID, forKey: "cartID")
//        coder.encode(self.itemName, forKey: "itemName")
//        coder.encode(self.itemImageUrl, forKey: "itemImageUrl")
//        coder.encode(self.itemQuantity, forKey: "itemQuantity")
//    }
//
//
//    // 檔案 -> Cart物件
//    required init?(coder: NSCoder) {
//        self.cartID = coder.decodeObject(forKey: "cartID") as! String
//        self.itemName = coder.decodeObject(forKey: "itemName") as? String
//        self.itemImageUrl = coder.decodeObject(forKey: "itemImageUrl") as? String
//        self.itemQuantity = coder.decodeObject(forKey: "itemQuantity") as? String
//    }
    
    

    
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        if lhs.itemImageUrl == rhs.itemImageUrl && lhs.itemName == rhs.itemName && lhs.itemPrice == rhs.itemPrice {
            return true
        }else{
            return false
        }
    }
}

