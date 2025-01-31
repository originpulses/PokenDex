//
//  StringExtensions.swift
//  PokenDex
//
//  Created by Sabih on 24/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

public extension String {
    func floatValue() -> Float? {
        return Float(self)
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
