

import UIKit
import Firebase
import FirebaseAuth

class ShoppingcartTableViewController: UITableViewController {
    
    var cart = [CartItem]()
    var heightForHeader:CGFloat = 0.0
    var heightForFooter:CGFloat = 0.0
    var footer: FooterViewCell?
    var db : Firestore!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDataSource()
        loadCart()
        db = Firestore.firestore()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        updateDataSource()
    }
    func updateDataSource() {
        self.cart = CartManager.shared.shoppingcart
        DispatchQueue.main.async { [self] in
            self.tableView.reloadData()
        }
        
    }
    
 
    
    @IBAction func orderBtn(_ sender: Any) {
        

        let orderID = UUID().uuidString
        let encoder = JSONEncoder()
        do {
            let data  = try encoder.encode(cart)
            let jsonString = String(data: data, encoding: .utf8)
            let currentSignInUser = Auth.auth().currentUser!.email
            let uid = Auth.auth().currentUser!.uid
            
           // let currentUserID = currentSignInUser.displayName
            db.collection("order").document(orderID).setData(["items":jsonString ?? "", "currentSignInUser":currentSignInUser ?? "","uid": uid]) { error in
                  
                self.cartClear()
                self.updateDataSource()

//                let currentSignInUser = Auth.auth().currentUser!
//                let currentUserID = currentSignInUser.uid
//                let query = Firestore.firestore().collection("users").whereField(currentUserID , isEqualTo: currentUserID)
//                print(currentUserID)
                
              //  let userID = "jCKcAPAcYI3YjfnSs4ip"
             //   self.db.collection("users").document(currentUserID ).setData(["orderID":orderID], merge: true)

                //分辨按鈕
                    if (sender as AnyObject).tag == 0 {
                        Tool.shared.showAlert(in: self, with: "已送出訂單\n\n\n訂單資訊：\n\n自訂購日起保留七日\n\n取貨時付款\n\n以自取方式\n自取地址：新北市中和區成功路999號1樓\n\n謝謝購買，歡迎再次選購！")
                        
                             

                      } else if (sender as AnyObject).tag == 1 {
//                                                        let controller = storyboard?.instantiateViewController(withIdentifier: PropertyKeys.shoppingcartController) as! UITableViewController
//                                                        present(controller, animated: true, completion: nil)
                            }
                        
          
            }
        }catch {
            print("error \(error)")
        }



        

        
    }
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cart.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.shoppingcartCell, for: indexPath) as? ShoppingcartTableViewCell else {return UITableViewCell()}
        cell.configure(with: cart[indexPath.row], at: indexPath.row)
        cell.delegate = self
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if cart.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.header) as! HeaderViewCell
            return cell.contentView
        }else {
            return nil
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if cart.count == 0 {
            heightForHeader = tableView.frame.height
        }else {
            heightForHeader = 0
        }
        return heightForHeader
    }
 
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if cart.count == 0 {
            self.footer = nil
            return nil
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.footer) as! FooterViewCell
            if let total = CartManager.shared.getTotal() {
                let totalPrice = "$ "+total
                cell.setUp(with: totalPrice)
                self.footer = cell
            }
            return cell.contentView
        }
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if cart.count != 0 {
            heightForFooter = 90
        }else {
            heightForFooter = 0
        }
        return heightForFooter
    }
}


extension ShoppingcartTableViewController: ShoppingcartTableViewCellDelegate {
    func showMessage(with message: String) {
        Tool.shared.showAlert(in: self, with: message)
    }

    func confirmAction(with completionHandler: @escaping (Bool?) -> Void) {
        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        controller.addAction(UIAlertAction(title: "刪除商品", style: .default, handler: { (_) in
            completionHandler(true)
        }))
        controller.addAction(UIAlertAction(title: "取消", style: .cancel, handler: {
            (_) in
            completionHandler(false)
        }))
        present(controller, animated: true, completion: nil)
    }
    
    func loadCart() {
        Tool.shared.readUserDefaultData(with: PropertyKeys.cart, and: [CartItem].self) { (cart) in
            guard let cart = cart else {return}
            CartManager.shared.shoppingcart = cart
            self.cart = cart
        }
        
    }
    
    
    func cartClear() {
        Tool.shared.readUserDefaultData(with: PropertyKeys.cart, and: [CartItem].self) { (cart) in
            guard let cart = cart else {return}
            CartManager.shared.shoppingcart = []
            self.cart = cart
        }
        
    }
    
    
    
}
