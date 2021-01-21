//
//  BackgroundScheduler.swift
//  Currency Rate
//
//  Created by Yurii Sameliuk on 21/01/2021.
//

import Foundation
import BackgroundTasks

class BackgroundScheduler {
    let backgroundAppRefreshTaskSchedulerIdentifier = "api.nbp.pl.BackgroundAppRefreshIdentifier"
    let backgroundProcessingTaskSchedulerIdentifier = "api.nbp.pl.BackgroundProcessingIdentifier"
    
    static let shared = BackgroundScheduler()
    
    func scheduleAppRefresh() {
        
        let request = BGAppRefreshTaskRequest(identifier: backgroundAppRefreshTaskSchedulerIdentifier)
        request.earliestBeginDate = Date(timeIntervalSinceNow: AppConstants.refreshInterval)

        do {
            try BGTaskScheduler.shared.submit(request)
       
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func handleAppRefresh(task: BGAppRefreshTask) {
        
        scheduleAppRefresh()
    
    }
}

