
import UIKit
import Firebase
import FirebaseFirestore

class DetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameTextView: UITextView!
    @IBOutlet weak var productPriceLabel: UILabel!
   
    @IBOutlet weak var quantityTextFeild: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
   
    
    var productToShowDetail: Product!
    var imageName: String!
    var colors = [String]()
    var selectedColor: String!
    var pickerField: UITextField!
    var favoriteList = [String]()
    
    
     var db: Firestore!
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//       // self.loadFromFile()
//
//    }
//    @IBAction func productLikeButtonTapped(_ sender: UIButton) {
//        var favoriteList = FavoriteListManager.shared.favoriteList
//        if favoriteList.contains(productNameTextView.text!) {
//            favoriteList.removeAll { (product) -> Bool in
//                let isMatch = product == productNameTextView.text!
//                return isMatch
//            }
//            DispatchQueue.main.async {
//                self.productLikeButton.imageView?.image = UIImage(systemName: "heart")
//            }
//
//        }else {
//            favoriteList.append(productNameTextView.text!)
//            DispatchQueue.main.async {
//                self.productLikeButton.imageView?.image = UIImage(systemName: "heart.fill")
//            }
//        }
//        FavoriteListManager.shared.favoriteList = favoriteList
//    }
//
//
    
    
    // MARK: Archiving
    
//    func writeToFile() {
//
//        let home = URL(fileURLWithPath: NSHomeDirectory())
//        let doc = home.appendingPathComponent("Documents")
//        let filePath = doc.appendingPathComponent("cart.archive")
//
//
//        do {
//            // 將data 陣列，轉成Data型式 （二進位資料）
//            let data = try NSKeyedArchiver.archivedData(withRootObject: self.newCart, requiringSecureCoding: false)
//            try data.write(to: filePath, options: .atomic)
//
//        } catch  {
//            print("error while saving to file \(error)")
//        }
//
//
//    }
//
//    func loadFromFile() {
//
//        let home = URL(fileURLWithPath: NSHomeDirectory())
//        let doc = home.appendingPathComponent("Documents")
//        let filePath = doc.appendingPathComponent("cart.archive")
//
//        do {
//            let data = try Data(contentsOf: filePath)
//            // 把資料轉成[CartItem]
//            if let arrayData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [CartItem] {
//                self.newCart = arrayData // 轉成功就放到self.newCart裡
//            }
//        } catch  {
//            print("error while fetching data array \(error)")
//            self.newCart = [] // 有任何錯誤，空陣列
//        }
//
//    }
//
    
    
    
    @IBAction func cartButtonTapped(_ sender: UIButton) {
        //cartItem
       
        
       let cartItem = CartItemController.shared.newCartItem(with: productToShowDetail, quantity: quantityTextFeild.text!)
        
        var newCart = [CartItem]()
        
        newCart.append(contentsOf: CartManager.shared.shoppingcart)
        if newCart.contains(cartItem) {
            let index = newCart.firstIndex(of: cartItem)!
            guard let quantity = Int(newCart[index].itemQuantity) else {return}
            var quantityBeforeUpdate = quantity
            quantityBeforeUpdate += 1
            newCart[index].itemQuantity = String(quantityBeforeUpdate)
        }else{
            newCart.append(cartItem)
        }
        print("cart.count = \(newCart.count)")
        CartManager.shared.shoppingcart = newCart
        
      //  self.writeToFile()
        
        
       //let cartData = [cartItem.itemName:cartItem.itemQuantity]
//      let cart = CartItem()
//
//        Cannot assign to property: 'cart' is a 'let' constant
//
////
//        db.collection("cartlists").document("userID").setData(["cart":cartData]){ error in
//            if let e = error{
//                print("error while adding data to firestore \(e)")
//                //alert
//                return
//            }
//        }

        
        
        
        
        //分辨按鈕
        if sender.tag == 0 {
            Tool.shared.showAlert(in: self, with: "已加入購物車")
            
            
        
            
        }else if sender.tag == 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: PropertyKeys.shoppingcartController) as! UITableViewController
            present(controller, animated: true, completion: nil)
        }
    }
 
    
    
    
    
    
    
    // 數量大於五時，顯示「一次最多只能購買五件」
    
    @IBAction func plusButton(_ sender: UIButton) {
        var quantity = Int(quantityTextFeild.text!)!
        if quantity < 5 {
            quantity += 1
            DispatchQueue.main.async {
                self.quantityTextFeild.text = String(quantity)
            }
        }else {
            Tool.shared.showAlert(in: self, with: "一次最多只能購買五件")
        }
    }
    
    // 數量小於1時，顯示「一次最多只能購買五件」
    
    @IBAction func minusButton(_ sender: UIButton) {
        
        var quantity = Int(quantityTextFeild.text!)!
        if quantity > 1 {
            quantity -= 1
        }
        DispatchQueue.main.async {
            self.quantityTextFeild.text = String(quantity)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        
        scrollView.showsVerticalScrollIndicator = false
        //colorTextField.delegate = self
//        favoriteList = FavoriteListManager.shared.favoriteList
        ProductController.shared.fetechData { Product in
            self.showDetail(of: self.productToShowDetail)
        }
        ProductController.shared.fetchProductName(with: productToShowDetail.productName) { (name) in
//            guard let colors = colors else {return}
//            self.colors = colors
//            selectedColor = colors[0]
            showDetail(of: productToShowDetail)
        }
    }
    
    func showDetail(of product: Product) {
        //setSizeSegmentedControl(with: product.productSizeChoices)
        
        DispatchQueue.main.async {
            self.productImageView.image = ProductController.shared.loadProductImage(with: product.imageUrl)
            self.productNameTextView.text = product.productName
            self.productPriceLabel.text = "NT$ \(product.productPrice)"
            self.descriptionTextView.text = product.productDescription
        }
        
       
//        colorTextField.text = selectedColor
//        colorLabel.text = "\(colors.count) Colours"
//        favoriteList.forEach { (favoriteProduct) in
//            if product.productName == favoriteProduct {
//                DispatchQueue.main.async {
//                    self.productLikeButton.imageView!.image = UIImage(systemName: "heart.fill")!
//                }
//            }
//        }
    }
//    func setSizeSegmentedControl(with productSizeChoices: String) {
//        for index in 0...3 {
//            sizeSegmentedControl.setEnabled(false, forSegmentAt: index)
//        }
//        let sizeChoices = productSizeChoices.components(separatedBy: ",")
//        var availableChoices = [ProductSize]()
//        for size in sizeChoices {
//            switch size {
//            case ProductSize.S.rawValue:
//                sizeSegmentedControl.setEnabled(true, forSegmentAt: 0)
//                availableChoices.append(.S)
//            case ProductSize.M.rawValue:
//                sizeSegmentedControl.setEnabled(true, forSegmentAt: 1)
//                availableChoices.append(.M)
//            case ProductSize.L.rawValue:
//                sizeSegmentedControl.setEnabled(true, forSegmentAt: 2)
//                availableChoices.append(.L)
//            case ProductSize.XL.rawValue:
//                sizeSegmentedControl.setEnabled(true, forSegmentAt: 3)
//                availableChoices.append(.XL)
//            default:
//                return
//            }
//        }
//        switch availableChoices[0] {
//        case .S:
//            sizeSegmentedControl.selectedSegmentIndex = 0
//        case .M:
//            sizeSegmentedControl.selectedSegmentIndex = 1
//        case .L:
//            sizeSegmentedControl.selectedSegmentIndex = 2
//        case .XL:
//            sizeSegmentedControl.selectedSegmentIndex = 3
//        }
//    }

}
extension DetailViewController: UITextFieldDelegate {
    //beginEditing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        DispatchQueue.main.async {
            self.initColorPickerView()
        }
    }
    //shouldReturn and resign
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func initColorPickerView() {
        let pickerView = UIPickerView()
     //   pickerView.delegate = self
        //製作picker view的tool bar
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = .systemBlue
        toolbar.sizeToFit()
        //set buttons
        let okButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(okMethod))
        let spaceInBetween = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelMethod))
        toolbar.setItems([cancelButton, spaceInBetween, okButton], animated: false)
        
        pickerField = UITextField(frame: CGRect.zero)
        view.addSubview(pickerField)
        pickerField.inputView = pickerView
        pickerField.inputAccessoryView = toolbar
        pickerField.becomeFirstResponder()
    }
    @objc func okMethod() {
        DispatchQueue.main.async { [self] in
           // colorTextField.text = selectedColor
            pickerField.resignFirstResponder()
        }
    }
    @objc func cancelMethod() {
        pickerField.resignFirstResponder()
    }
}
//picker view有delegate跟 datasource
//extension DetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return colors.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        //row是筆數，component是群組
//        return colors[row]
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        selectedColor = colors[row]
//    }
//}
//
