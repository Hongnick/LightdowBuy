//
//  OrderListViewController.swift
//  LightdowBuy
//
//  Created by student on 2021/8/5.
//

import UIKit
import Firebase
import CodableFirebase


class OrderListViewController: UIViewController {


    @IBOutlet weak var orderList: UITextView!
    
    var db: FirebaseDecoder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        let currentSignInUser = Auth.auth().currentUser!
        let currentUserID = currentSignInUser.uid
        let query = Firestore.firestore().collection("order").whereField("uid", isEqualTo: currentUserID)


        query.getDocuments() { [weak self] (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if let userInfo = querySnapshot?.documents.first {
                        DispatchQueue.main.async {
                            // Set label text to first name
//                            do {
//                                self?.db.orderList.text = userInfo["items"] as? String
//                            } catch {
//                                
//                            }
                           
                           
                        }
                    }
                }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
