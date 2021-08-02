

import Foundation
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
        case productName = "gsx$productname"
        case productPrice = "gsx$productprice"
        case imageUrl = "gsx$imageurl"
        case numberBeenBought = "gsx$numberbeenbought"
        case productDescription = "gsx$productdescription"
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






