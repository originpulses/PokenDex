//
//  PokendexService.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation
import Alamofire

public class PokedexService {
    func get(url: String, completion: @escaping (Result<Data?, HttpError>) -> ()) {
        AF.request(url, method: .get).responseJSON { response in
            if let status = response.response?.statusCode {
                switch(status){
                case 204:
                    completion(.success(nil))
                case 200...299:
                    completion(.success(response.data))
                case 401:
                    completion(.failure(.unauthorized))
                case 403:
                    completion(.failure(.forbidden))
                case 400...499:
                    completion(.failure(.badRequest))
                case 500...599:
                    completion(.failure(.serverError))
                default:
                    completion(.failure(.noConnectivity))
                }
            }
        }
    }
}
