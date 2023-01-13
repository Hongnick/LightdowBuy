//
//  BaseViewController.swift
//  LightdowBuy
//
//  Created by Nick on 2022/10/25.
//

import UIKit
import Toast



class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     //   view.backgroundColor = .white
       
    }
    
    func startLoading() {
        self.view.makeToastActivity(.center)
    }
    
    func stopLoading() {
        self.view.hideToastActivity()
    }
    
    func showNavigationBar() {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func hideNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }

  

}


