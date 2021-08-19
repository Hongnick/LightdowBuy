import UIKit

class ProductCollectionViewController: UICollectionViewController {
    
    var products = [Product]()
    var favoriteList = [String]()
    var loadingView = UIActivityIndicatorView()
    var stillLoadingOrNot: Bool!
    var cart:[CartItem]?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView = Tool.shared.setLoadingView(in: self, with: loadingView)
        loadCart()
      
        updateDataSource()
    }
    
    override func viewDidLayoutSubviews() {
       setCellFlowLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        self.cart = CartManager.shared.shoppingcart
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PropertyKeys.productCell, for: indexPath) as? ProductCollectionViewCell else {return UICollectionViewCell()}
        // Configure the cell
        configure(for: cell, at: indexPath.row)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: PropertyKeys.segueToDetail, sender: indexPath)
    }
    
    func updateDataSource() {
        DispatchQueue.main.async { [self] in
            stillLoadingOrNot = true
            Tool.shared.loading(activity: loadingView, is: stillLoadingOrNot)
        }
        ProductController.shared.fetechData { [self] (products) in
            guard let products = products else {return}
            self.products = products
            DispatchQueue.main.async { [self] in
                self.collectionView.reloadData()
                stillLoadingOrNot = false
                Tool.shared.loading(activity: loadingView, is: stillLoadingOrNot)
            }
        }
    }
    
    func loadCart() {
        Tool.shared.readUserDefaultData(with: PropertyKeys.cart, and: [CartItem].self) { (cart) in
            guard let cart = cart else {return}
            CartManager.shared.shoppingcart = cart
            self.cart = cart
        }
        
    }
   

    func setCellFlowLayout(){
        let itemSpace:CGFloat = 30
        let width = floor((collectionView.bounds.width - itemSpace * 3) / 2)
        let height = width / 140 * 175
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {return}
        flowLayout.estimatedItemSize = .zero
        flowLayout.itemSize = CGSize(width: width, height: height)
        flowLayout.minimumLineSpacing = itemSpace
        flowLayout.minimumInteritemSpacing = itemSpace
        //設定cell的邊界距離
        flowLayout.sectionInset.left = itemSpace
        flowLayout.sectionInset.right = itemSpace
        flowLayout.sectionInset.top = itemSpace
        flowLayout.sectionInset.bottom = itemSpace
    }
    
    func configure(for cell: ProductCollectionViewCell, at row: Int) {

        cell.layer.borderWidth = 0
        cell.layer.borderColor = UIColor.gray.cgColor
        let product =  products[row]

        cell.productImageView.image = ProductController.shared.loadProductImage(with: product.imageUrl)
        cell.productNameTextView.text = product.productName
        cell.productPriceLabel.text = "NT$ \(product.productPrice)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PropertyKeys.segueToDetail {
            guard let controller = segue.destination as? DetailViewController, let indexPath = sender as? IndexPath else {return}
            controller.productToShowDetail = products[indexPath.row]
        }
    }
}

