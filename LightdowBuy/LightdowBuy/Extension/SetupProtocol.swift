//
//  SetupProtocol.swift
//  LightdowBuy
//
//  Created by Nick on 2022/10/25.
//

import Foundation
import UIKit
import Network

@objc public protocol SetupProtocol: NSObjectProtocol {
    @objc optional func initMethod()
    @objc optional func setupNavigation()
    @objc optional func setupUI()
    @objc optional func setupLayout()
    @objc optional func setupEvent()
}





