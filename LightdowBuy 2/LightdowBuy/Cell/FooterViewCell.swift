

import UIKit

class FooterViewCell: UITableViewCell {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUp(with totalPrice:String) {
        backgroundColor = .white
        titleLabel.text = "總計:"
        DispatchQueue.main.async {
            self.totalLabel.text = totalPrice
        }
    }
    func update(with cart:[CartItem]) -> String{
        var total = 0
        for cartItem in cart {
            guard let quantity = Int(cartItem.itemQuantity), let price = Int(cartItem.itemPrice) else {return "0"}
            total += Int(quantity * price)
        }
        return String(total)
    }
}

