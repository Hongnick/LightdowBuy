
import Foundation
import UIKit

struct ProductController {
    static let shared = ProductController()
    static let jsonUrl = "https://spreadsheets.google.com/feeds/list/19mvppo59kjQ0WwAdBweFYtyXjM2WdIS8tQF5YchDdb4/od6/public/values?alt=json"
    
    
    func fetechData(with completion: @escaping ([Product]?) -> Void) {
        guard let url = URL(string: ProductController.jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
            let decoder = JSONDecoder()
            if let data = data, let loadeJson = try? decoder.decode(JsonStructure.self, from: data) {
                var products = [Product]()
                let entry = loadeJson.feed.entry
                entry.forEach { (entry) in
                    let productName = entry.productName.value
                    let productPrice = entry.productPrice.value
                    let imageUrl = entry.imageUrl.value
                    let numberBeenBought = entry.numberBeenBought.value
                    let productdescription = entry.productDescription.value
                    let product = Product(productName: productName, productPrice: productPrice, imageUrl: imageUrl, numberBeenBought: numberBeenBought, productDescription: productdescription)
                    products.append(product)
                }
            completion(products)
        }
            
            
        }.resume()
                
    }
    func loadProductImage(with imageUrl: String) -> UIImage {
        guard let url = URL(string: imageUrl) else {return UIImage(named: "noImage")!}
        let tempDirectory = FileManager.default.temporaryDirectory
        let imageFileUrl = tempDirectory.appendingPathComponent(url.lastPathComponent)
        if FileManager.default.fileExists(atPath: imageFileUrl.path) {
            let image = UIImage(contentsOfFile: imageFileUrl.path)!
            return image
        }else {
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {return UIImage(named: "noImage")!}
            try? data.write(to: imageFileUrl)
            return image
        }
        
    }
    
    func fetchProductName(with productName: String, completion: ([String]?) -> Void){
        let name = productName.components(separatedBy: ",")
        completion(name)
    }

}
