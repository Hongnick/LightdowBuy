//
//  UIButton.swift
//  LightdowBuy
//
//  Created by Nick on 2022/10/25.
//

import Foundation
import UIKit

extension UIButton {
     func setBackgroundColor(color: UIColor, forState: UIControl.State) {
         self.clipsToBounds = true  // add this to maintain corner radius
         // UIGraphicsBeginImageContext建立一個基於點陣圖的上下文(context),並將其設定為當前上下文(context)。
         UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
         // UIGraphicsGetCurrentContext 當前圖形
         if let context = UIGraphicsGetCurrentContext() {
             // setFillColor 使用cgColor設置當前圖形顏色
             context.setFillColor(color.cgColor)
             // 使用當前圖形狀態下的填充顏色，繪製矩形內的區域。
             context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
             // UIGraphicsGetImageFromCurrentImageContext 從當前圖形上下文的內容中返回圖像。
             let colorImage = UIGraphicsGetImageFromCurrentImageContext()
             
             // 移除當前圖形上下文。
             UIGraphicsEndImageContext()
             //setBackgroundImage 設置用於指定按鈕狀態的背景圖像。
             self.setBackgroundImage(colorImage, for: forState)
         }
     }
 }
