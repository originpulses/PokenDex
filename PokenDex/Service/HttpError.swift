//
//  HttpError.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

public enum HttpError: Error {
    
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
    
}
