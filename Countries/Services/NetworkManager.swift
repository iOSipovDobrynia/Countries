//
//  NetworkManager.swift
//  Countries
//
//  Created by Goodwasp on 18.09.2023.
//

import Foundation
import Alamofire

enum Link: String {
    case countries = "https://restcountries.com/v3.1/all?fields=name,flags"
}

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchCountries(from url: String, completion: @escaping(Result<[Country], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let countries = Country.getContries(from: value)
                    completion(.success(countries))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
