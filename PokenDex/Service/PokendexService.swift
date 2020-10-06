//
//  PokendexService.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation
import Alamofire

// Main PokeAPI Service through which all the URLs of PokeAPI are processed

// Note: PokeAPI has URLs nested within URLs so this sort of design was implemented after thorough research on how to parse this kind of API

public class PokendexService {
    
    func get(url: String, completion: @escaping (Swift.Result<Data?, HttpError>) -> ()) {
        Alamofire.request(url, method: .get).responseJSON { response in
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
