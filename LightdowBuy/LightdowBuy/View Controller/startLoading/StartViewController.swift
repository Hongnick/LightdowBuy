//
//  StartViewController.swift
//  LightdowBuy
//
//  Created by Nick on 2022/11/14.
//

import UIKit


class StartViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startLoading()
        
        let queue = DispatchQueue(label: "beforeEnterStartViewController")
        let group = DispatchGroup()
        
        // 從Api 先讀取產品清單
        let getProductListWorkItem = DispatchWorkItem {
            group.enter()
            CenterManager.shared.getProductList {
                group.leave()
            }
        }
        
        queue.async(execute: getProductListWorkItem)
        
        group.notify(queue: .main) {
            self.stopLoading()
            self.compareVersion()
        }
    }
    
    private func compareVersion() {
        
        // 跑完資料 顯示 「登入畫面」
        let vc = LoginViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }

  
}
