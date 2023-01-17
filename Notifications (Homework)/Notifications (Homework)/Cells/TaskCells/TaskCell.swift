//
//  TaskCell.swift
//  Notifications (Homework)
//
//  Created by Ivan Kuzmenkov on 6.12.22.
//

import UIKit

class TaskCell: UITableViewCell {
    static let id = String(describing: TaskCell.self)

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
}
