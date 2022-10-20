

import Foundation


struct JsonStructure: Codable {
    var productName: String
    var productPrice: String
    var imageUrl: String
    var numberBeenBought: String
    var productDescription: String
   
}


struct JsonStructure: Codable {
    var feed: Feed
}

struct Feed: Codable {
    var entry: [Entry]
}

struct Entry: Codable {
    var productName: ProductName
    var productPrice: ProductPrice
    var imageUrl: ImageUrl
    var numberBeenBought: NumberBeenBought
    var productDescription: ProductDescription
    enum CodingKeys: String, CodingKey {
        case productName = "productname"
        case productPrice = "productprice"
        case imageUrl = "imageurl"
        case numberBeenBought = "numberbeenbought"
        case productDescription = "productdescription"
    }


}


struct ProductName: Codable {
    var value: String
    enum CodingKeys: String, CodingKey {
        case value = "$t"
    }
}

struct ProductPrice: Codable {
    var value: String
    enum CodingKeys: String, CodingKey {
        case value = "$t"
    }
}

struct ImageUrl: Codable {
    var value: String
    enum CodingKeys: String, CodingKey {
        case value = "$t"
    }
}

struct NumberBeenBought: Codable {
    var value: String
    enum CodingKeys: String, CodingKey {
        case value = "$t"
    }
}

struct ProductDescription: Codable {
    var value: String
    enum CodingKeys: String, CodingKey {
        case value = "$t"
    }
}






