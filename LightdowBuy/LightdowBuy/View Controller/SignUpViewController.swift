//
//  SignUpViewController.swift
//  LightdowBuy
//
//  Created by student on 2021/7/20.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
  //  @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
   
    @IBOutlet weak var cellPhoneTextField: UITextField!
    
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
               self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
        
    }
    
    @objc func dismissKeyBoard() {
         self.view.endEditing(true)
     }
    
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        
        // Style the elements
        
        
        
        
    }
    
    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    
    
    
    func validateFields() -> String? {
        
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           // lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           // emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            cellPhoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "請填寫所有欄位"
        }
        
        // Check if the password is secure
        
        let cheanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cheanedPassword) == false {
            // Password isn't secure enough
            return "密碼至少為 8 個字符，包含英數和特殊符號"
        }
        
        return nil
    }
    
    
    

    @IBAction func signUpTapped(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let Name = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
          //  let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let cellphone = cellPhoneTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                   // self.showError("Email格式錯誤")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["name":Name,     "cellphone":cellphone,"email":email, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.navigationController?.popViewController(animated: true)
                   
                }
                
            }
            
            
            
        }
        
    }
    
    func showError(_ message: String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
 
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func Loginbg(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
