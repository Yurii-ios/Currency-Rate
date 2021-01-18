//
//  AppConstants.swift
//  Currency Rate
//
//  Created by Yurii Sameliuk on 17/01/2021.
//

import Foundation

struct AppConstants {
    
    // add flags to currencies code
    static let flags = ["🇹🇭 1 ", "🇺🇸 1 ", "🇦🇺 1 ", "🇭🇰 1 ", "🇨🇦 1 ", "🇳🇿 1 ", "🇸🇬 1 ", "🇪🇺 1 ", "🇭🇺 1 ", "🇨🇭 1 ", "🇬🇧 1 ", "🇺🇦 1 ", "🇯🇵 1 ", "🇨🇿 1 ", "🇩🇰 1 ", "🇮🇸 1 ", "🇳🇴 1 ", "🇸🇪 1 ", "🇭🇷 1 ", "🇷🇴 1 ", "🇧🇬 1 ", "🇹🇷 1 ", "🇮🇱 1 ", "🇨🇱 1 ", "🇵🇭 1 ", "🇲🇽 1 ", "🇿🇦 1 ", "🇧🇷 1 ", "🇲🇾 1 ",  "🇷🇺 1 ", "🇮🇩 1 ", "🇮🇳 1 ", "🇰🇷 1 ", "🇨🇳 1 ", "🇵🇱 1 "]
   
    static let cellIdentifier = "cell"
    static let exchangeDetailSegue = "exchangeDetailSegue"
}

struct NetworkConstant {
    
    // load data from NBP(Narodowy Bank Polski)
    static let url = "http://api.nbp.pl/api/exchangerates/tables/a/?format=json"
    
}
