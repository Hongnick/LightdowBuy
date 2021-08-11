//
//  MemberViewController.swift
//  LightdowBuy
//
//  Created by student on 2021/7/20.
//

import UIKit
import FirebaseAuth
import Firebase
//import FirebaseDatabase
import MessageUI


class MemberViewController: UIViewController, MFMailComposeViewControllerDelegate {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cellphoneLabel: UILabel!
    var cart = [CartItem]()
    
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        
        //var ref: FIRDocumentSnapshotBlock
      //  Auth.auth().removeStateDidChangeListener()
        if Auth.auth().currentUser != nil {
        do {
            try Auth.auth().signOut()
          // dismiss(animated: true, completion: nil)

        } catch {
            print("User could not sign out.")
        }

        self.transitionToHome()
            
            func cartClear() {
                Tool.shared.readUserDefaultData(with: PropertyKeys.cart, and: [CartItem].self) { (cart) in
                    guard let cart = cart else {return}
                    CartManager.shared.shoppingcart = []
                    self.cart = cart
                }
                
            }
    }
}
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
   
        let currentSignInUser = Auth.auth().currentUser!
        let currentUserID = currentSignInUser.uid
        let query = Firestore.firestore().collection("users").whereField("uid", isEqualTo: currentUserID)
        
        
        query.getDocuments() { [weak self] (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if let userInfo = querySnapshot?.documents.first {
                        DispatchQueue.main.async {
                            // Set label text to first name
                            self?.nameLabel.text = userInfo["name"] as? String
                            self?.emailLabel.text = userInfo["email"] as? String
                            self?.cellphoneLabel.text = userInfo["cellphone"] as? String
                        }
                    }
                }
        }
        
    }
    
    
    func transitionToHome() {
        
        let LoginViewController =
            storyboard?.instantiateViewController(identifier: Constants.Storyboard.LoginViewController)
        view.window?.rootViewController = LoginViewController
      
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    
    
    @IBAction func sendMail(_ sender: Any) {
        showMailComposer()
        
      
    }
    
    
    func showMailComposer() {

        guard MFMailComposeViewController.canSendMail() else {
             print("Mail services are not available")
            return
        }

        let composerVC = MFMailComposeViewController()
        composerVC.mailComposeDelegate = self
        composerVC.setToRecipients(["nick55002@gmail.com"])
        composerVC.setSubject("請記得填寫主旨，歡迎詢問")
        composerVC.setMessageBody("您好！", isHTML: false)

        present(composerVC, animated: true)
    }

        
    private func mailComposeViewController(controller: MFMailComposeViewController,
                               didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        // Check the result or perform other tasks.
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func teacherMail(_ sender: Any) {
        teacherMailComposer()
    }
    
    
    func teacherMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
             print("Mail services are not available")
            return
        }
        
        let teachercomposerVC = MFMailComposeViewController()
        teachercomposerVC.mailComposeDelegate = self
        teachercomposerVC.setToRecipients(["k74123699@gmail.com"])
        teachercomposerVC.setSubject("請記得填寫主旨，歡迎詢問")
        teachercomposerVC.setMessageBody("您好！", isHTML: false)
        
        present(teachercomposerVC, animated: true)
    }

        
    private func mailComposeController(controller: MFMailComposeViewController,
                               didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        // Check the result or perform other tasks.

        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }

    
        
}

