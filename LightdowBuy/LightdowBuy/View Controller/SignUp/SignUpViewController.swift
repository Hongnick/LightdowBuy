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
import SnapKit

class SignUpViewController: BaseViewController {

 
    static let initButton: (_ title: String, _ enable: Bool ) -> UIButton = { (title, enable) in
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.black, for: .disabled)
        button.setTitle(title, for: .normal)
        button.isEnabled = enable
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setBackgroundColor(color: UIColor(hexString: "#26000000"), forState: .disabled)
        button.setBackgroundColor(color: UIColor(hexString: "E0E9EE"), forState: .normal)
        
        return button
    }
    
    
    let logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = AppImage.image(image: .lightdowBuyLogo)
        logoImage.contentMode =  .scaleAspectFit
        return logoImage
    }()
    
    
    let appLabel: UILabel = {
        let appLabel = UILabel()
        appLabel.font = UIFont.boldSystemFont(ofSize: 20)
        appLabel.text = "光影藝術治療"
        appLabel.textColor = UIColor.black
        appLabel.textAlignment = .center
        return appLabel
    }()
    
    let signUpLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.font = UIFont.boldSystemFont(ofSize: 20)
        loginLabel.text = "註冊"
        loginLabel.textColor = UIColor.black
        loginLabel.textAlignment = .center
        return loginLabel
    }()
    
    
    let signUpTitleView: UIView = {
        let signUpTitleView = UIView()
        signUpTitleView.backgroundColor = UIColor(hexString: "#33000000")
        
        return signUpTitleView
    }()
    
    
    
    let signUpView: UIView = {
        let signUpView = UIView()
        signUpView.backgroundColor = UIColor(hexString: "#1A000000")
        
        return signUpView
    }()
    
    let nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "請輸入姓名"
        nameTextField.backgroundColor = UIColor.white
       // nameTextField.backgroundColor = UIColor(hexString: "#0D000000")
        nameTextField.layer.cornerRadius = 10
        nameTextField.clipsToBounds = true
        //設定游標預設位置   this will add a 20pt padding to the textField
        nameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0));
        nameTextField.leftViewMode = .always
        return nameTextField
    }()
    
    
    let cellphoneTextField: UITextField = {
        let cellphoneTextField = UITextField()
        cellphoneTextField.placeholder = "請輸入手機號碼"
        cellphoneTextField.backgroundColor = UIColor.white
       // cellphoneTextField.backgroundColor = UIColor(hexString: "#0D000000")
        cellphoneTextField.layer.cornerRadius = 10
        cellphoneTextField.clipsToBounds = true
        //設定游標預設位置   this will add a 20pt padding to the textField
        cellphoneTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0));
        cellphoneTextField.leftViewMode = .always
        return cellphoneTextField
    }()
    
    // email 即等於 帳號
    let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "請輸入信箱"
        emailTextField.backgroundColor = UIColor.white
       // emailTextField.backgroundColor = UIColor(hexString: "#0D000000")
        emailTextField.layer.cornerRadius = 10
        emailTextField.clipsToBounds = true
        //設定游標預設位置   this will add a 20pt padding to the textField
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0));
        emailTextField.leftViewMode = .always
        return emailTextField
    }()
   
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "請輸入密碼"
        passwordTextField.backgroundColor = UIColor.white
       // passwordTextField.backgroundColor = UIColor(hexString: "#0D000000")
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.clipsToBounds = true
        //設定游標預設位置   this will add a 20pt padding to the textField
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0));
        passwordTextField.leftViewMode = .always
        return passwordTextField
    }()
    
    
    
    let signUpBtn: UIButton = initButton("註冊", true)
    
    var alreadyAccountLabel: UILabel!
    let alreadyAccountText = "已經有帳號了嗎？ 登入"
    let loginText = "登入"
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 讓各頁面不會滑動到LoginViewController
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        view.addBackground()
        initMethod()
       

        setUpElements()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
               self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //hideNavigationBar()
        hideNavigationBar()
       
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideNavigationBar()
    }
    
    
    
    
    
    
    @objc func dismissKeyBoard() {
         self.view.endEditing(true)
     }
    
    func setUpElements() {
        
        // Hide the error label
       // errorLabel.alpha = 0
        
        
        // Style the elements
        
        
        
        
    }
    
    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    
    
//
//    func validateFields() -> String? {
//
//
//        // Check that all fields are filled in
//        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//           // lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//           // emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            cellPhoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
//
//            return "請填寫所有欄位"
//        }
//
//        // Check if the password is secure
//
//        let cheanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//        if Utilities.isPasswordValid(cheanedPassword) == false {
//            // Password isn't secure enough
//            return "密碼至少為 8 個字符，包含英數和特殊符號"
//        }
//
//        return nil
//    }
    
    
    

//    @IBAction func signUpTapped(_ sender: Any) {
//
//        // Validate the fields
//        let error = validateFields()
//
//        if error != nil {
//
//            // There's something wrong with the fields, show error message
//            showError(error!)
//        }
//        else {
//
//            // Create cleaned versions of the data
//            let Name = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//          //  let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//            let cellphone = cellPhoneTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//
//
//            // Create the user
//            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
//
//                // Check for errors
//                if err != nil {
//
//                    // There was an error creating the user
//                   // self.showError("Email格式錯誤")
//                }
//                else {
//
//                    // User was created successfully, now store the first name and last name
//                    let db = Firestore.firestore()
//
//                    db.collection("users").addDocument(data: ["name":Name,     "cellphone":cellphone,"email":email, "uid": result!.user.uid ]) { (error) in
//
//                        if error != nil {
//                            // Show error message
//                            self.showError("Error saving user data")
//                        }
//                    }
//
//                    // Transition to the home screen
//                    self.navigationController?.popViewController(animated: true)
//
//                }
//
//            }
//
//
//
//        }
//
//    }
    
//    func showError(_ message: String) {
//
//        errorLabel.text = message
//        errorLabel.alpha = 1
//    }
//
    
 

    @IBAction func Loginbg(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}


extension SignUpViewController: SetupProtocol {
    
    func initMethod() {
        setupUI()
        setupLayout()
        setupEvent()
        
    }
    
    func setupUI() {
        view.addSubview(logoImage)
        view.addSubview(signUpView)
        view.addSubview(appLabel)
        view.addSubview(signUpTitleView)
        signUpTitleView.addSubview(signUpLabel)
        
        
        signUpView.addSubview(nameTextField)
        signUpView.addSubview(cellphoneTextField)
        signUpView.addSubview(emailTextField)
        signUpView.addSubview(passwordTextField)
        signUpView.addSubview(signUpBtn)
        
        
        alreadyAccountLabel = UILabel()
        
        let formattedText = String.format(strings: [loginText],keywordFont: UIFont.boldSystemFont(ofSize: 16), keywordColor: UIColor.blue, inString: alreadyAccountText, font: UIFont.boldSystemFont(ofSize: 16),color: UIColor.black)
        
        alreadyAccountLabel.attributedText = formattedText
        alreadyAccountLabel.numberOfLines = 0
        alreadyAccountLabel.textAlignment = .center
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleLoginUpTextTapped))
        alreadyAccountLabel.addGestureRecognizer(tap)
        alreadyAccountLabel.isUserInteractionEnabled = true
        
        signUpView.addSubview(alreadyAccountLabel)
    }
    
    func setupLayout() {
        logoImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            $0.leading.equalTo(view).offset(30)
            $0.trailing.equalTo(view).offset(-30)
            $0.height.equalTo(120)
        }
        
        appLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(20)
            $0.leading.equalTo(view).offset(30)
            $0.trailing.equalTo(view).offset(-30)
            $0.centerX.equalTo(view)
            
        }
        
        
        signUpTitleView.snp.makeConstraints {
            $0.top.equalTo(appLabel.snp.bottom).offset(30)
            $0.leading.equalTo(view).offset(30)
            $0.trailing.equalTo(view).offset(-30)
            $0.height.equalTo(50)
        }
        
        signUpLabel.snp.makeConstraints {
            $0.leading.equalTo(signUpTitleView).offset(30)
            $0.trailing.equalTo(signUpTitleView).offset(-30)
            $0.centerY.equalTo(signUpTitleView)
        }
        
        
        
        signUpView.snp.makeConstraints {
            $0.top.equalTo(signUpTitleView.snp.bottom)
            $0.leading.equalTo(view).offset(30)
            $0.trailing.equalTo(view).offset(-30)
            $0.height.equalTo(400)
            
        }
        
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(signUpView).offset(30)
            $0.leading.equalTo(signUpView).offset(10)
            $0.trailing.equalTo(signUpView).offset(-10)
            $0.height.equalTo(48)
        }
        
        cellphoneTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(10)
            $0.leading.equalTo(signUpView).offset(10)
            $0.trailing.equalTo(signUpView).offset(-10)
            $0.height.equalTo(48)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(cellphoneTextField.snp.bottom).offset(10)
            $0.leading.equalTo(signUpView).offset(10)
            $0.trailing.equalTo(signUpView).offset(-10)
            $0.height.equalTo(48)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.leading.equalTo(signUpView).offset(10)
            $0.trailing.equalTo(signUpView).offset(-10)
            $0.height.equalTo(48)
        }
        
        
        signUpBtn.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(40)
            $0.leading.equalTo(signUpView).offset(10)
            $0.trailing.equalTo(signUpView).offset(-10)
            $0.height.equalTo(48)
        }
        
        alreadyAccountLabel.snp.makeConstraints {
            $0.top.equalTo(signUpBtn.snp.bottom).offset(16)
            $0.leading.equalTo(signUpView).offset(30)
            $0.trailing.equalTo(signUpView).offset(-30)
        }
        
        
        
    }
    
    func setupEvent() {
        signUpBtn.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
    }
    
    
    
    @objc func handleLoginUpTextTapped(gesture: UITapGestureRecognizer) {
        let textString = alreadyAccountText as NSString
        let textRange = textString.range(of: loginText)
        
        let tapLocation = gesture.location(in: alreadyAccountLabel)
        let index = alreadyAccountLabel.indexOfAttributedTextCharacterAtPoint(point: tapLocation)
        
        if checkRange(textRange, contain: index) == true {
            loginUpBtnPressed()
            return
        }
    }
    
    func checkRange(_ range: NSRange, contain index: Int) -> Bool {
        return index > range.location && index < range.location + range.length
    }
    
    
    
    @objc func loginUpBtnPressed() {
        
        let vc = LoginViewController()
         navigationController?.pushViewController(vc, animated: true)
    
    
    }
    
    
    
    @objc func signUpAction() {
        
        // Create cleaned versions of the data
        let Name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      //  let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let cellphone = cellphoneTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
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
                       // self.showError("Error saving user data")
                    }
                }
                
                // Transition to the home screen
                self.navigationController?.popViewController(animated: true)
               
            }
            
        }
        
        
        
    }
    
    
    
}
