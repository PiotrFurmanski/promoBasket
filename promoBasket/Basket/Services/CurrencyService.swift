//
//  CurrencyService.swift
//  promoBasket
//
//  Created by Piotr Furmanski on 22/02/2020.
//  Copyright © 2020 Piotr Furmanski. All rights reserved.
//

import Foundation

protocol CurrencyServiceProtocol: class {
    func loadCurrencyRates(completion: @escaping (_ currencyPairs: [String: CurrencyPair]?, _ error: Error?) -> ())
}

class CurrencyService: CurrencyServiceProtocol {
    
    private struct Constanst {
        static let url = "https://www.freeforexapi.com/api/live?"
    }
    
    func loadCurrencyRates(completion: @escaping (_ currencyPairs: [String: CurrencyPair]?, _ error: Error?) -> ()) {
        let currencies = ["EUR", "PLN", "GBP", "CAD"]
        var currenciesParam = "pairs="
        for currency in currencies {
            currenciesParam += "USD\(currency),"
        }
        currenciesParam.removeLast()
        let apiUrlStr = Constanst.url + currenciesParam
        guard let url = URL(string: apiUrlStr) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            self?.handleResponse(data: data, response: response, error: error, completion: completion)
        }
        task.resume()
    }
    
    private func handleResponse(data: Data?, response: URLResponse?, error: Error?,
                        completion: @escaping (_ currencyPairs: [String: CurrencyPair]?, _ error: Error?) -> ()) {
        guard error == nil else {
            completion(nil, error)
            return
        }

        guard let data = data else {
            completion(nil, nil)
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(CurrencyResponse.self, from: data)
            completion(response.rates, nil)
        } catch let error {
            completion(nil, error)
        }
    }
}
