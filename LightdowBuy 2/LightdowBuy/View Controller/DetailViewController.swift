
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
        

        
        scrollView.showsVerticalScrollIndicator = false

        ProductController.shared.fetechData { Product in
            self.showDetail(of: self.productToShowDetail)
        }
        ProductController.shared.fetchProductName(with: productToShowDetail.productName) { (name) in

            showDetail(of: productToShowDetail)
        }
    }
    
    func showDetail(of product: Product) {
        
        DispatchQueue.main.async {
            self.productImageView.image = ProductController.shared.loadProductImage(with: product.imageUrl)
            self.productNameTextView.text = product.productName
            self.productPriceLabel.text = "NT$ \(product.productPrice)"
            self.descriptionTextView.text = product.productDescription
        }
        
    
    }
  

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

