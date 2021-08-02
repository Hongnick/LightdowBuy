
import Foundation
struct FavoriteListManager {
    static var shared = FavoriteListManager(favoriteList: [String]())
    var favoriteList:[String]
}
