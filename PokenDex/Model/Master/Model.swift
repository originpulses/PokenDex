//
//  Model.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

protocol Model: Encodable, Decodable, Equatable {}

extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
