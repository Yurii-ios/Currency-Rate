//
//  BackgroundScheduler.swift
//  Currency Rate
//
//  Created by Yurii Sameliuk on 21/01/2021.
//

import Foundation
import BackgroundTasks

class BackgroundScheduler {
    let backgroundAppRefreshTaskSchedulerIdentifier = "http://api.nbp.pl/api/exchangerates/tables/a/?format=jsonBackgroundAppRefreshIdentifier"
    let backgroundProcessingTaskSchedulerIdentifier = "http://api.nbp.pl/api/exchangerates/tables/a/?format=jsonBackgroundProcessingIdentifier"
}

