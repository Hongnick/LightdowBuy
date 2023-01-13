//
//  AppFont.swift
//  LightdowBuy
//
//  Created by Nick on 2022/10/20.
//

import Foundation
import UIKit

struct AppFont {
    
    enum FontType {
        case titleBold
        case titleRegular
        case subtitleBold
        case subtitleRegular
        case bodyBold
        case bodyRegular
        case tinyBold
        case tinyRegular
        case captionBold
        case captionRegular
    }
    
    static func font(type: FontType) -> UIFont {
        switch type {
        case .titleBold:
            return .boldSystemFont(ofSize: 36)
        case .titleRegular:
            return .systemFont(ofSize: 24)
        case .subtitleBold:
            return .boldSystemFont(ofSize: 18)
        case .subtitleRegular:
            return .systemFont(ofSize: 18)
        case .bodyBold:
            return .boldSystemFont(ofSize: 16)
        case .bodyRegular:
            return .systemFont(ofSize: 16)
        case .tinyBold:
            return .boldSystemFont(ofSize: 14)
        case .tinyRegular:
            return .systemFont(ofSize: 14)
        case .captionBold:
            return .boldSystemFont(ofSize: 12)
        case .captionRegular:
            return .systemFont(ofSize: 12)
        }
        
        
        
    }
    
}

