//
//  DataStore.swift
//  Currency Rate
//
//  Created by Yurii Sameliuk on 18/01/2021.
//

import Foundation

class DataStore {
    
    let defaults = UserDefaults.standard
    
    func saveStringInCache(name: String ) {
        defaults.setValue(name, forKey: "currencyStringRate")
    }
    
    func saveDoubleInCache(name: Double ) {
        defaults.setValue(name, forKey: "currencyDoubleRate")
    }

    func getDoubleFromCache() -> Double {
        let saved = defaults.double(forKey: "currencyDoubleRate")
        return saved
    }
    
    func getStringFromCache() -> String {
        let saved = defaults.string(forKey: "currencyStringRate")
        guard let savedRates = saved else { return ""}
        return savedRates
    }
}
