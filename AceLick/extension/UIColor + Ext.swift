//
//  UIColor + Ext.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let primary = UIColor.rgb(red: 70, green: 43, blue: 152)
    static let lightGrey = UIColor.rgb(red: 221, green: 221, blue: 221)
    static let kitYellow = UIColor.rgb(red: 201, green: 170, blue: 5)
    static let kitGreen = UIColor.rgb(red: 14, green: 128, blue: 60)
    static let kitIconGrey = UIColor.rgb(red: 121, green: 119, blue: 119)
}

