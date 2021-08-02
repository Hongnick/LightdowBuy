

import Foundation
protocol ShoppingcartTableViewCellDelegate {
    func showMessage(with message:String)
    func confirmAction(with completionHandler: @escaping (Bool?) -> Void)
}
