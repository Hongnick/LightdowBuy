//
//  Utilities.swift
//  LightdowBuy
//
//  Created by student on 2021/7/20.
//

import Foundation

class Utilities {
    
    
    static func isPasswordValid(_ password : String) -> Bool {
        // 正則表達式
        let passwordText = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordText.evaluate(with: password)
        
    }
}


