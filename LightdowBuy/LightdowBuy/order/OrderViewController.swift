//
//  OrderViewController.swift
//  LightdowBuy
//
//  Created by Nick on 2022/12/28.
//

import UIKit
import SnapKit


class OrderViewController: BaseViewController {
    
    let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.white
        
        return backgroundView
    }()
    
    
    let orderTitleImage: UIImageView = {
        let orderTitleImage = UIImageView()
        orderTitleImage.image = AppImage.image(image: .longMark)
        orderTitleImage.contentMode = .scaleAspectFit
        orderTitleImage.translatesAutoresizingMaskIntoConstraints = false
        orderTitleImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        orderTitleImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return orderTitleImage
    }()
    
    
    
    let orderUserDataTitle: UILabel = {
        let orderUserDataTitle = UILabel()
        orderUserDataTitle.font = UIFont.boldSystemFont(ofSize: 20)
        orderUserDataTitle.text = "訂購者資料"
        orderUserDataTitle.textColor = UIColor.gray
        
        return orderUserDataTitle
    }()
    
    let userDataContainerView: UIStackView = {
        let userDataContainerView = UIStackView()
        userDataContainerView.axis = .horizontal
        userDataContainerView.distribution = .fillProportionally
        userDataContainerView.translatesAutoresizingMaskIntoConstraints = false
        userDataContainerView.spacing = 5
        return userDataContainerView
    }()
    
    
    let userNameLabel: UILabel = {
        let userName = UILabel()
        userName.font = UIFont.boldSystemFont(ofSize: 20)
        userName.text = "姓名"
        return userName
    }()
    
    
    let userNameTextField: UITextField = {
        let userNameTextField = UITextField()
        userNameTextField.placeholder = "請輸入姓名"
        userNameTextField.backgroundColor = UIColor.white
       // passwordTextField.backgroundColor = UIColor(hexString: "#0D000000")
        userNameTextField.layer.cornerRadius = 5
        userNameTextField.clipsToBounds = true
        userNameTextField.layer.borderColor = UIColor.black.cgColor
        userNameTextField.layer.borderWidth = 1
        //設定游標預設位置   this will add a 20pt padding to the textField
        userNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0));
        userNameTextField.leftViewMode = .always
        return userNameTextField
    }()
    
    
    let cellPhoneLabel: UILabel = {
        let cellphoneLabel = UILabel()
        cellphoneLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cellphoneLabel.text = "手機"
        return cellphoneLabel
    }()
    
    let cellPhoneTextField: UITextField = {
        let cellPhoneTextField = UITextField()
        cellPhoneTextField.placeholder = "請輸入手機號碼"
        cellPhoneTextField.backgroundColor = UIColor.white
       // passwordTextField.backgroundColor = UIColor(hexString: "#0D000000")
        cellPhoneTextField.layer.cornerRadius = 5
        cellPhoneTextField.clipsToBounds = true
        cellPhoneTextField.layer.borderColor = UIColor.black.cgColor
        cellPhoneTextField.layer.borderWidth = 1
        //設定游標預設位置   this will add a 20pt padding to the textField
        cellPhoneTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0));
        cellPhoneTextField.leftViewMode = .always
        return cellPhoneTextField
    }()
    
    
    let storeDataContainerView: UIStackView = {
        let storeDataContainerView = UIStackView()
        storeDataContainerView.axis = .horizontal
        storeDataContainerView.distribution = .fillProportionally
        storeDataContainerView.translatesAutoresizingMaskIntoConstraints = false
        storeDataContainerView.spacing = 5
        return storeDataContainerView
    }()
    
    
    
    let storeDataImage: UIImageView = {
        let storeDataImage = UIImageView()
        storeDataImage.image = AppImage.image(image: .longMark)
        storeDataImage.contentMode = .scaleAspectFit
        storeDataImage.translatesAutoresizingMaskIntoConstraints = false
        storeDataImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        storeDataImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return storeDataImage
    }()
    
    
    
    let storeDataTitle: UILabel = {
        let storeDataTitle = UILabel()
        storeDataTitle.font = UIFont.boldSystemFont(ofSize: 20)
        storeDataTitle.text = "商店資訊"
        storeDataTitle.textColor = UIColor.gray
        
        return storeDataTitle
    }()
    
    let takeGoodsTitle: UILabel = {
        let storeDataTitle = UILabel()
        storeDataTitle.font = UIFont.boldSystemFont(ofSize: 20)
        storeDataTitle.text = "自取"
        storeDataTitle.textColor = UIColor(hexString: "195E7C")
        storeDataTitle.layer.borderColor = UIColor.black.cgColor
        storeDataTitle.layer.borderWidth = 1
        storeDataTitle.textAlignment = .center
        
        return storeDataTitle
    }()
    
    let takeGoodsDaysLabel: UILabel = {
        let takeGoodsDaysLabel = UILabel()
        takeGoodsDaysLabel.font = UIFont.boldSystemFont(ofSize: 17)
        takeGoodsDaysLabel.text = "商品為下單後保留七天"
        takeGoodsDaysLabel.textColor = UIColor(hexString: "195E7C")
        return takeGoodsDaysLabel
    }()
    
    
    let storeAddressTitle: UILabel = {
        let storeAddressTitle = UILabel()
        storeAddressTitle.font = UIFont.boldSystemFont(ofSize: 20)
        storeAddressTitle.text = "商店地址"
        storeAddressTitle.textColor = UIColor.black
        return storeAddressTitle
    }()
    
    let storeAddressInfo: UITextView = {
        let storeAddressInfo = UITextView()
        storeAddressInfo.font = UIFont.systemFont(ofSize: 17)
        storeAddressInfo.text = "(光影藝術治療)\n新北市中和區成功路888號1樓"
        storeAddressInfo.textColor = UIColor.black
        storeAddressInfo.backgroundColor = .clear
        storeAddressInfo.isUserInteractionEnabled = false
        return storeAddressInfo
    }()
    
    
    let storeRemarkLabel: UILabel = {
        let storeRemarkLabel = UILabel()
        storeRemarkLabel.font = UIFont.boldSystemFont(ofSize: 20)
        storeRemarkLabel.text = "備註"
        storeRemarkLabel.textColor = UIColor.black
        return storeRemarkLabel
    }()
    
    let storeRemarkTextView: UITextView = {
        let storeRemarkLabel = UITextView()
        storeRemarkLabel.layer.cornerRadius = 5
        storeRemarkLabel.clipsToBounds = true
        storeRemarkLabel.layer.borderColor = UIColor.black.cgColor
        storeRemarkLabel.layer.borderWidth = 1
        return storeRemarkLabel
    }()
    
    
     let continueBuyBtn: UIButton = {
        let continueBuy = UIButton()
         continueBuy.setTitle("繼續加購", for: .normal)
         continueBuy.backgroundColor = UIColor(hexString: "C4C4C4")
         continueBuy.setTitleColor(UIColor.red, for: .normal)
         continueBuy.layer.cornerRadius = 10
         continueBuy.clipsToBounds = true
         continueBuy.semanticContentAttribute = .forceLeftToRight
         continueBuy.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
         continueBuy.addTarget(self, action: #selector(continueToBuy), for: .touchUpInside)
        
        return continueBuy
     }()
    
    let checkOutBtn: UIButton = {
        let checkOutBtn = UIButton()
        checkOutBtn.setTitle("確認結帳", for: .normal)
        checkOutBtn.backgroundColor = UIColor(hexString: "E0E9EE")
        checkOutBtn.setTitleColor(UIColor.red, for: .normal)
        checkOutBtn.layer.cornerRadius = 10
        checkOutBtn.clipsToBounds = true
        checkOutBtn.semanticContentAttribute = .forceLeftToRight
        checkOutBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        checkOutBtn.addTarget(self, action: #selector(uploadOrderAction), for: .touchUpInside)
        return checkOutBtn
    }()
    
    
    let checkOutContainerView: UIStackView = {
        let checkOutContainerView = UIStackView()
        checkOutContainerView.axis = .horizontal
        checkOutContainerView.distribution = .fillProportionally
        checkOutContainerView.translatesAutoresizingMaskIntoConstraints = false
        checkOutContainerView.spacing = 5
        return checkOutContainerView
    }()
    
    
    var centerManager: CenterManager?
    
    
    func logoNavgationBarButtonItem() {
        
        
        var leftConfiguration = UIButton.Configuration.filled()
        var leftTitle = AttributedString("光影藝術治療")
        leftTitle.font = UIFont(name: "AmericanTypewriter-Bold", size: 17)
        leftConfiguration.attributedTitle = leftTitle
        leftConfiguration.image = AppImage.image(image: .lightdowBuyLogo)
        leftConfiguration.baseForegroundColor = .black
        leftConfiguration.imagePlacement = .leading
        leftConfiguration.background.backgroundColor = .clear
        let leftAction = UIAction { action in
            print("leftConfiguration Button tap")
        }
    
        
        let logoButton = UIButton(configuration: leftConfiguration, primaryAction: leftAction)
        
        logoButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        logoButton.setImage(UIImage(named: "LightdowBuylogo44"), for: .normal)
        let leftBarButtonItem = UIBarButtonItem(customView: logoButton)
        
        
        
        var rightConfiguration = UIButton.Configuration.filled()
        var rightTitle = AttributedString("訂單資訊")
        rightTitle.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        rightConfiguration.attributedTitle = rightTitle
        rightConfiguration.baseForegroundColor = .brown
        rightConfiguration.background.backgroundColor = .clear
        let rightAction = UIAction { action in
            print("rightConfiguration Button tap")
        }
        
        let rightButton = UIButton(configuration: rightConfiguration, primaryAction: rightAction)
        
        rightButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
       
        let rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
       
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem

    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initMethod()
        logoNavgationBarButtonItem()
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "D0CAE2")
        
        navigationController?.view.backgroundColor = UIColor(hexString: "D0CAE2")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
               self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
    }
    

    

}


extension OrderViewController: SetupProtocol {
    func initMethod() {
        setupUI()
        setupLayout()
    }
    
    func setupUI() {
        
        view.addSubview(backgroundView)
        
        backgroundView.addSubview(userDataContainerView)
        userDataContainerView.addArrangedSubview(orderTitleImage)
        userDataContainerView.addArrangedSubview(orderUserDataTitle)
        
        backgroundView.addSubview(userNameLabel)
        backgroundView.addSubview(userNameTextField)
        
        backgroundView.addSubview(cellPhoneLabel)
        backgroundView.addSubview(cellPhoneTextField)
        
        backgroundView.addSubview(storeDataContainerView)
        storeDataContainerView.addArrangedSubview(storeDataImage)
        storeDataContainerView.addArrangedSubview(storeDataTitle)
        
        
        backgroundView.addSubview(takeGoodsTitle)
        backgroundView.addSubview(takeGoodsDaysLabel)
        backgroundView.addSubview(storeAddressTitle)
        backgroundView.addSubview(storeAddressInfo)
        
        backgroundView.addSubview(storeRemarkLabel)
        backgroundView.addSubview(storeRemarkTextView)
        
        backgroundView.addSubview(checkOutContainerView)
        checkOutContainerView.addArrangedSubview(continueBuyBtn)
        checkOutContainerView.addArrangedSubview(checkOutBtn)
        
    }
    
    func setupLayout() {
        
        backgroundView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        userDataContainerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.leading.equalTo(view).offset(20)
            $0.height.equalTo(30)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(userDataContainerView.snp.bottom).offset(30)
            $0.leading.equalTo(view).offset(40)
        }
        
        userNameTextField.snp.makeConstraints {
            $0.top.equalTo(userDataContainerView.snp.bottom).offset(20)
            $0.leading.equalTo(userNameLabel).offset(55)
            $0.trailing.equalTo(view).offset(-20)
            $0.height.equalTo(40)
        }
        
        cellPhoneLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(30)
            $0.leading.equalTo(view).offset(40)
        }
        
        cellPhoneTextField.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(20)
            $0.leading.equalTo(cellPhoneLabel).offset(55)
            $0.trailing.equalTo(view).offset(-20)
            $0.height.equalTo(40)
        }
        
        
        storeDataContainerView.snp.makeConstraints {
            $0.top.equalTo(cellPhoneLabel.snp.bottom).offset(30)
            $0.leading.equalTo(view).offset(20)
            $0.height.equalTo(30)
        }
        
        takeGoodsTitle.snp.makeConstraints {
            $0.top.equalTo(storeDataContainerView.snp.bottom).offset(30)
            $0.leading.equalTo(view).offset(50)
            $0.width.equalTo(90)
            $0.height.equalTo(50)
        }
        
        takeGoodsDaysLabel.snp.makeConstraints {
            $0.top.equalTo(storeDataContainerView.snp.bottom).offset(45)
            $0.leading.equalTo(takeGoodsTitle).offset(100)
            
        }
        
        storeAddressTitle.snp.makeConstraints {
            $0.top.equalTo(takeGoodsTitle.snp.bottom).offset(30)
            $0.leading.equalTo(view).offset(40)
            
        }
        
        storeAddressInfo.snp.makeConstraints {
            $0.top.equalTo(takeGoodsDaysLabel.snp.bottom).offset(30)
            $0.leading.equalTo(storeAddressTitle.snp.trailing).offset(20)
            $0.trailing.equalTo(view).offset(-10)
            $0.height.equalTo(50)
        }
        
        storeRemarkLabel.snp.makeConstraints {
            $0.top.equalTo(storeAddressTitle.snp.bottom).offset(50)
            $0.leading.equalTo(view).offset(40)
        }
        
        storeRemarkTextView.snp.makeConstraints {
            $0.top.equalTo(storeAddressInfo.snp.bottom).offset(30)
            $0.leading.equalTo(storeRemarkLabel.snp.trailing).offset(20)
            $0.trailing.equalTo(view).offset(-20)
            $0.height.equalTo(100)
            
        }
        
        checkOutContainerView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.leading.equalTo(view).offset(30)
            $0.trailing.equalTo(view).offset(-30)
            $0.height.equalTo(50)
        }
        
        
    }
    
    
    @objc func dismissKeyBoard() {
         self.view.endEditing(true)
     }
        
    @objc func uploadOrderAction() {
        CenterManager.shared.upload()
    }
    
    
    @objc func continueToBuy() {
    
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
}
