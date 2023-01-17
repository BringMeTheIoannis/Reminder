//
//  SubTaskModel.swift
//  Notifications (Homework)
//
//  Created by Ivan Kuzmenkov on 6.12.22.
//

import Foundation
import RealmSwift


class SubTaskModel: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var taskName = ""
    @objc dynamic var taskDate = Date()
    @objc dynamic var ownerID = ""
    @objc dynamic var isComplete = false
    
     convenience init(taskName: String, taskDate: Date, ownerID: String) {
         self.init()
         self.taskName = taskName
         self.taskDate = taskDate
         self.ownerID = ownerID
    }
}
