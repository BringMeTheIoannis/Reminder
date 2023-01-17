//
//  CreateTaskController.swift
//  Notifications (Homework)
//
//  Created by Ivan Kuzmenkov on 6.12.22.
//

import UIKit

class CreateTaskController: UIViewController {
    
    var remindersArray = [String]()
    let checkedSquareImage = UIImage(systemName: "checkmark.square")
    let squareImage = UIImage(systemName: "square")
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTimePicker.date = Date.now
        dateTimePicker.minimumDate = Date.now
    }
    
    @IBAction func addButton(_ sender: Any) {
        guard let text = textField.text else { return }
        let model = TaskModel(listName: text, date: dateTimePicker.date)
        remindersArray.forEach { item in
            model.reminders.append(item)
        }
        RealmManager<TaskModel>().write(object: model)
        NotificationManager().createPush(model)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func fifteenActionButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.setImage(checkedSquareImage, for: .normal)
            remindersArray.append(Reminders.fifteenSecondsRemider.rawValue)
        } else {
            sender.setImage(squareImage, for: .normal)
            guard let index =  remindersArray.firstIndex(of: Reminders.fifteenSecondsRemider.rawValue) else { return }
            remindersArray.remove(at: index)
        }
    }
    
    @IBAction func thirtyActionButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.setImage(checkedSquareImage, for: .normal)
            remindersArray.append(Reminders.thirtySecondsReminder.rawValue)
        } else {
            sender.setImage(squareImage, for: .normal)
            guard let index =  remindersArray.firstIndex(of: Reminders.thirtySecondsReminder.rawValue) else { return }
            remindersArray.remove(at: index)
        }
    }
    
    @IBAction func sixtyActionButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.setImage(checkedSquareImage, for: .normal)
            remindersArray.append(Reminders.sixtySecondsReminder.rawValue)
        } else {
            sender.setImage(squareImage, for: .normal)
            guard let index =  remindersArray.firstIndex(of: Reminders.sixtySecondsReminder.rawValue) else { return }
            remindersArray.remove(at: index)
        }
    }
}
