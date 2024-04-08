//
//  WebService.swift
//  mssCyriptex
//
//  Created by ahmet azak on 5.04.2024.
//

import Foundation
enum CyriptoError :Error {
    case serverError
    case parsingError
}
class WebService {
    func downloadCurrencies (url : URL , completion : @escaping(Result<[Cyripto],CyriptoError>)->()) {
        URLSession.shared.dataTask(with: url){data,response,error in
          
            if let _ = error {
                completion(.failure(.serverError))
            }
            else if let data = data {
              let cyriptoList = try? JSONDecoder().decode([Cyripto].self, from: data)
                if let cyriptoList = cyriptoList {
                    completion(.success(cyriptoList))
                }
                else
                {
                    completion(.failure(.parsingError))
                }
            }
            
        }.resume()
    }
}
