//
//  RealmManager.swift
//  Notifications (Homework)
//
//  Created by Ivan Kuzmenkov on 6.12.22.
//

import Foundation
import RealmSwift


class RealmManager<T> where T: Object {
    
    private let realm = try? Realm()
    
    func write(object: T) {
        guard let realm = realm else { return }
        try? realm.write {
            realm.add(object)
        }
    }
    
    func read() -> [T] {
        guard let realm = realm else { return []}
        return Array(realm.objects(T.self))
    }
     
    func delete(object: T) {
        guard let realm = realm else { return }
        try? realm.write{
            realm.delete(object)
        }
    }
}
