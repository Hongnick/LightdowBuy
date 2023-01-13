//
//  String.swift
//  LightdowBuy
//
//  Created by Nick on 2022/10/28.
//

import Foundation
import UIKit


extension String {
    static func format(strings: [String],
                       keywordFont: UIFont = UIFont.boldSystemFont(ofSize: 14),
                       keywordColor: UIColor = UIColor.blue,
                       inString string: String,
                       font: UIFont = UIFont.systemFont(ofSize: 14),
                       color: UIColor = UIColor.black) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string,
                                                         attributes: [NSAttributedString.Key.font: font,
                                                                      NSAttributedString.Key.foregroundColor: color])
        let keywordFontAttribute = [NSAttributedString.Key.font: keywordFont, NSAttributedString.Key.foregroundColor: keywordColor]
        for keyword in strings {
            attributedString.addAttributes(keywordFontAttribute, range: (string as NSString).range(of: keyword))
        }
        return attributedString
    }
}



