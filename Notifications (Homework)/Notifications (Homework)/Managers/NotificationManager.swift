//
//  NotificationManager.swift
//  Notifications (Homework)
//
//  Created by Ivan Kuzmenkov on 6.12.22.
//

import Foundation
import UserNotifications


final class NotificationManager {
    private let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAuth() {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { access, error in
            
        }
    }
    
    func createPush(_ task: TaskModel) {
        task.reminders.forEach { reminder in
            switch reminder {
            case Reminders.fifteenSecondsRemider.rawValue:
                createAndAddNotificationModel(taskModel: task, secondsToRemind: 15)
            case Reminders.thirtySecondsReminder.rawValue:
                createAndAddNotificationModel(taskModel: task, secondsToRemind: 30)
            case Reminders.sixtySecondsReminder.rawValue:
                createAndAddNotificationModel(taskModel: task, secondsToRemind: 60)
            default:
                createAndAddNotificationModel(taskModel: task, secondsToRemind: 0)
            }
        }
    }
    
    func createAndAddNotificationModel(taskModel: TaskModel, secondsToRemind: Double) {
        let content = UNMutableNotificationContent()
        content.title = taskModel.listName
        content.subtitle = secondsToRemind == 0 ? "Reminder" : "Reminder: \(Int(secondsToRemind)) seconds left"
        content.sound = .default
        let calendar = Calendar.current
        let timeStamp = taskModel.date.timeIntervalSince1970 - secondsToRemind
        let date = Date(timeIntervalSince1970: timeStamp)
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        notificationCenter.add(request)
    }
}
