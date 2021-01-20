//
//  Notifications.swift
//  Currency Rate
//
//  Created by Yurii Sameliuk on 18/01/2021.
//

import UIKit
import UserNotifications

class Notifications: UIResponder {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAutorization() -> Bool {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            self.notificationCenter.delegate = self
        }
        return true
    }
    
    func scheduleNotification(notification: String) {
        let content = UNMutableNotificationContent()
        let userAcrion = "User Action"
        content.title = notification
        content.body = "The current value of the exchange rate has changed"
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = userAcrion
        content.threadIdentifier = notification
        
        guard let path = Bundle.main.path(forResource: "rate", ofType: "jpg") else { return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            
            let attachment = try UNNotificationAttachment(identifier: "favicon", url: url, options: nil)
            content.attachments = [attachment]
            
        } catch {
            let error = error
            fatalError(error.localizedDescription)
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 6, repeats: false)
        
        let identifire = UUID().uuidString
        
        let request = UNNotificationRequest (identifier: identifire, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                fatalError("\(error.localizedDescription)")
            }
        }
        
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        
        let category = UNNotificationCategory(identifier: userAcrion,
                                              actions: [snoozeAction, deleteAction],
                                              intentIdentifiers: [],
                                              options: [])
        notificationCenter.setNotificationCategories([category])
        
    }
}

extension Notifications: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.notification.request.identifier == "Local Notification" {
            
        }
        
        switch response.actionIdentifier {
        
        case "Snooze":
            scheduleNotification(notification: "Reminder")
        default:
            break
        }
        completionHandler()
    }
}
