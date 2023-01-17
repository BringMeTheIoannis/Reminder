//
//  TaskModel.swift
//  Notifications (Homework)
//
//  Created by Ivan Kuzmenkov on 6.12.22.
//

import Foundation
import RealmSwift



enum Reminders: String {
    case fifteenSecondsRemider = "fifteenSecondsRemider"
    case thirtySecondsReminder = "thirtySecondsReminder"
    case sixtySecondsReminder = "sixtySecondsReminder"
}

class TaskModel: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var listName: String = ""
    @objc dynamic var date: Date = Date()
    let reminders = List<String>()
    
    
    convenience init(listName: String, date: Date) {
        self.init()
        self.id = UUID().uuidString
        self.listName = listName
        self.date = date
        reminders.append("baseReminder")
    }
}
