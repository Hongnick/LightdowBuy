//
//  TabBarViewController.swift
//  LightdowBuy
//
//  Created by Nick on 2022/10/25.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundColor = .white
        tabBar.tintColor = AppColor.Color.selectedColor.color

        
        let homeVC = HomePageViewController()
        let homeNVC = UINavigationController(rootViewController: homeVC)
        homeNVC.tabBarItem.image = UIImage(systemName: "house")?.withRenderingMode(.alwaysTemplate)
        homeNVC.tabBarItem.title = "首頁"
        
        
        let serviceVC = ServiceViewController()
        let serviceNVC = UINavigationController(rootViewController: serviceVC)
        serviceNVC.tabBarItem.image = AppImage.image(image: .tabBarIcon(.service))?.withRenderingMode(.alwaysTemplate)
        serviceNVC.tabBarItem.title = "服務"
        
        let productListVC = ProductCollectionViewController()
        let productListNVC = UINavigationController(rootViewController: productListVC)
        productListNVC.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle")?.withRenderingMode(.alwaysTemplate)
        productListNVC.tabBarItem.title = "心靈小舖"
        
        
        let cartItemVC = ShoppingcartTableViewController()
        let cartItemNVC = UINavigationController(rootViewController: cartItemVC)
        cartItemNVC.tabBarItem.image = UIImage(systemName: "cart")?.withRenderingMode(.alwaysTemplate)
        cartItemNVC.tabBarItem.title = "購物車"
        
        let meditationVC = MeditationViewController()
        let meditationNVC = UINavigationController(rootViewController: meditationVC)
        meditationNVC.tabBarItem.image = UIImage(systemName: "music.note.tv.fill")?.withRenderingMode(.alwaysTemplate)
        meditationNVC.tabBarItem.title = "冥想音樂"
        
        let memberVC = MemberViewController()
        let memberNVC = UINavigationController(rootViewController: memberVC)
        memberNVC.tabBarItem.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysTemplate)
        memberNVC.tabBarItem.title = "會員中心"
        
        viewControllers = [homeNVC, serviceNVC,productListNVC,cartItemNVC,memberNVC]
        
        
        
    }
    



}
