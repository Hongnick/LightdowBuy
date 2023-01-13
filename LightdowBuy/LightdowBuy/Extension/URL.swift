//
//  URL.swift
//  LightdowBuy
//
//  Created by Nick on 2022/11/14.
//

import Foundation

extension URL {
    
    static var documentDir: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
