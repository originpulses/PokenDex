//
//  Stats.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

public struct Stats : Model {
    let base_stat : Int?
    let effort : Int?
    let stat : Stat?
    
    public init(base_stat : Int?, effort : Int?, stat : Stat?) {
        self.base_stat = base_stat
        self.effort = effort
        self.stat = stat
    }
}
