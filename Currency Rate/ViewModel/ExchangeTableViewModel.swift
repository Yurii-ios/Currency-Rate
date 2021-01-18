//
//  ExchangeTableViewModel.swift
//  Currency Rate
//
//  Created by Yurii Sameliuk on 17/01/2021.
//

import UIKit

struct ExchangeTableViewModel {
    private var rate: Rate
    
}

extension ExchangeTableViewModel {
    init(_ rate: Rate) {
        self.rate = rate
    }
}

extension ExchangeTableViewModel {
    // currencies code
    var currency: String {
        return self.rate.code
    }
    
    // currencies value
    var currencyValue: String {
        return "\(String(format: "%.2f", rate.mid)) PLN 🇵🇱"
    }
}

