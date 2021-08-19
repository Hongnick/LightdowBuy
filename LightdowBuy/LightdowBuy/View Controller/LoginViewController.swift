//
//  LoginViewController.swift
//  LightdowBuy
//
//  Created by student on 2021/7/18.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    var window: UIWindow?
    
    @IBOutlet weak var emailAddress: UITextField!
    
    @IBOutlet weak var loginpassword: UITextField!
    
    @IBOutlet weak var loginView: UIView!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var SignInOutlet: UIButton!
    
   
//    func validateFields() -> String? {
//
//        if emailAddress.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            password.text!.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
//
//            return "請填寫所有欄位"
//        }
//
//        return nil
//    }
    
    
//    func setRootViewController() {
//        if Auth.auth().currentUser != nil {
//
//        } else {
//            print("error")
//        }
//    }
//
    
    
    
    
    
    
    
    
    
    @IBAction func signInBtn(_ sender: Any) {
      
        
//        if emailAddress.text != "" && password.text != "" {
//
//            authService(email: emailAddress.text!, password: password.text!)
//
//        } else {
//            //print("Please entry your email and password.")
//            displayAlert(title: "Sign In Error", message: "Please entry your email and password.")
//        }
        
        // TODO: Validate Text Fields
        
//       let error =  validateFields()
//
//
//        if error != nil {
//            showError(error!)
//        } else {
            
        // Create cleaned versions of the text field
        let email = emailAddress.text!  //.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = loginpassword.text!  //.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
          
            
            if error != nil {
                // Couldn't sign in
//                self.errorLabel.text = error!.localizedDescription
//                self.errorLabel.alpha = 1
                
            

                
                
                
                
            }
            else {
 
            
                let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
                self.view.window?.rootViewController = tabBarController
                
                
            }
        }
        
    }
 
    func showError(_ message: String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
               self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
            
        setUpElements()
        
    
        //setCorner(customView: loginView, radius: 10)
        setCorner(customView: SignInOutlet, radius: 10)
    }
    

    @objc func dismissKeyBoard() {
         self.view.endEditing(true)
     }
    
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the elements
    }
    
    
    func setCorner (customView : UIView, radius : CGFloat) {
        customView.layer.cornerRadius = radius
        customView.clipsToBounds = true
  
        


    }
    
    
    
    func setTextField(customTextField: UITextField, iconName : String) {
        
        customTextField.leftViewMode = UITextField.ViewMode.always
        
        
        
        let iconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        iconView.contentMode = UIView.ContentMode.scaleAspectFit
        iconView.image = UIImage(named: iconName)
        
        customTextField.leftView = iconView
        
        customTextField.borderStyle = UITextField.BorderStyle.line
        customTextField.layer.borderWidth = 1
        customTextField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
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
