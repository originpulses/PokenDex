//
//  UIColorExtension.swift
//  PokenDex
//
//  Created by Sabih on 5/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit
import Foundation

// An extension that lets you pass hex code to UIColor
// Reference used: https://www.hackingwithswift.com/example-code/UIColor/how-to-convert-a-hex-colour-to-a-UIColor

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexcolour = String(hex[start...])
            
            if hexcolour.count == 8 {
                let scanner = Scanner(string: hexcolour)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}
