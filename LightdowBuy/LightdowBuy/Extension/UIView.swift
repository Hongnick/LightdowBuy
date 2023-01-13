//
//  UIView.swift
//  LightdowBuy
//
//  Created by Nick on 2022/10/28.
//

import Foundation
import UIKit

extension UIView {
    func addBackground() {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "Loginbg")
        
        imageViewBackground.contentMode = .scaleAspectFit
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
    
}


