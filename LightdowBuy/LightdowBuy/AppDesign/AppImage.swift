//
//  AppImage.swift
//  LightdowBuy
//
//  Created by Nick on 2022/10/20.
//

import Foundation
import UIKit

struct AppImage {
    
    enum Image {
        
        case tabBarIcon(TabBarIcon)
        case pswIcon
        case userIcon
        case lightdowBuyLogo
        case grayView
        case longMark
        case memberImg
        case volaperson
        case nickperson
        case heartlong
        case cardImg
        case drawImg
        
        enum TabBarIcon {
            case service
            
            var name: String {
                switch self {
               
                case .service:
                    return "serviceIcon"
                }
            }
            
            
            
        }
        
        
        
        
        
        var name: String {
            switch self {
                
            case .pswIcon:
                return "pswIcon"
            case .userIcon:
                return "userIcon"
            case .tabBarIcon(let icon):
                return icon.name
            case .lightdowBuyLogo:
                return "LightdowBuyLogo"
            case .grayView:
                return "grayView"
            case .longMark:
                return "longMark"
            case .memberImg:
                return "memberImg"
            case .volaperson:
                return "volaperson"
            case .nickperson:
                return "nickperson"
            case .heartlong:
                return "heartlong"
            case .cardImg:
                return "cardImg"
            case .drawImg:
                return "drawImg"
            }
        }
        
        
    }
    
    static func image(image: Image) -> UIImage? {
        return UIImage(named: image.name)
    }
    
    
    
}
