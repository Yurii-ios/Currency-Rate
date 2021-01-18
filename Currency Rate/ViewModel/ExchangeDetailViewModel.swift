//
//  ExchangeDetailViewModel.swift
//  Currency Rate
//
//  Created by Yurii Sameliuk on 17/01/2021.
//

import UIKit

class ExchangeDetailViewModel: DetailViewModelType {
    
    private var rate: Rate
    private var countryFlags: String
    
    var currencyDetail: String {
        return "\(countryFlags + rate.code) = \(String(format: "%.2f", rate.mid)) PLN 🇵🇱"
        }
    var currencyRate: Double {
        return Double(String(format: "%.2f", rate.mid))!
    }
    
    init(rate: Rate, countryFlags: String) {
           self.rate = rate
           self.countryFlags = countryFlags
       }
}

