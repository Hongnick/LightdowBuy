//
//  ConfirmOrderViewController.swift
//  LightdowBuy
//
//  Created by student on 2021/7/28.
//

import UIKit
import Firebase

class ConfirmOrderViewController: UIViewController {

    @IBOutlet weak var ordererName: UITextField!
    
    @IBOutlet weak var cellPhone: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var cart = [CartItem]()
    var productToShowDetail: Product!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        updateDataSource()
    }
    func updateDataSource() {
        self.cart = CartManager.shared.shoppingcart
//        DispatchQueue.main.async { [self] in
//            self.ta
//        }
        
    }
    
  
    
    var db : Firestore!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        db = Firestore.firestore()
        
       
    }
    

    
    func validateFields() -> String? {
        
        
        // Check that all fields are filled in
        if ordererName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           // lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            cellPhone.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
           {
            
            return "請填寫所有欄位"
        }
        
      
    
        return nil
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    @IBAction func confirmOrder(_ sender: Any) {
        
        let orderID = UUID().uuidString
        let encoder = JSONEncoder()
        
        do {
            let data  = try encoder.encode(cart)
            let jsonString = String(data: data, encoding: .utf8)
            db.collection("order").document(orderID).setData(["items":jsonString ?? ""]) { error in
                
                let userID = "jCKcAPAcYI3YjfnSs4ip"
               self.db.collection("users").document(userID).setData(["orderID":orderID], merge: true)
                
                //分辨按鈕
                    if (sender as AnyObject).tag == 0 {
                        Tool.shared.showAlert(in: self, with: "已送出訂單")
          
                    } else if (sender as AnyObject).tag == 1 {}
              
                
          
            }
        }catch {
            print("error \(error)")
        }
        
        
        
        
        
        
    }
            
    
    func showError(_ message: String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
        func loadCart() {
            Tool.shared.readUserDefaultData(with: PropertyKeys.cart, and: [CartItem].self) { (cart) in
                guard let cart = cart else {return}
                CartManager.shared.shoppingcart = cart
                self.cart = cart
            }
            
        }
        
        
            
      
}
