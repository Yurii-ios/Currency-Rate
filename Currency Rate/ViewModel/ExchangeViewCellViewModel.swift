//
//  ExchangeViewCellViewModel.swift
//  Currency Rate
//
//  Created by Yurii Sameliuk on 17/01/2021.
//

import UIKit

class ExchangeViewCellViewModel {
  
   private var rates: [Rate]
    
     var seletectedIndexPath: IndexPath?
    
    init(rates: [Rate]) {
        self.rates = rates
    }
}

extension ExchangeViewCellViewModel {
    
    func numberOfRowsInSection() -> Int {
        return self.rates.count
    }
    
    func rateAtIndex(_ index: Int) -> ExchangeTableViewModel {
        let rate = self.rates[index]
        return ExchangeTableViewModel(rate)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.seletectedIndexPath = indexPath
    }
    
     func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let seletectedIndexPath = seletectedIndexPath else { return nil }
        let countryFlags = AppConstants.flags[seletectedIndexPath.row]
        return ExchangeDetailViewModel(rate: self.rates[seletectedIndexPath.row], countryFlags: countryFlags)
    }
}

