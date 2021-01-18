//
//  NetworkDataFetcher.swift
//  Currency Rate
//
//  Created by Yurii Sameliuk on 17/01/2021.
//

import Foundation

class NetworkDataFetcher {
    
   private var networkService = NetworkService()
  
    func fetch(urlString: String, completion: @escaping ([Rate]?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let exchangeResponse = try? JSONDecoder().decode([ExchangeModel].self, from: data)
                
                if let exchangeResponse = exchangeResponse {
                    completion(exchangeResponse[0].rates)
                }
            }
        }
    }
}
