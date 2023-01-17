//
//  TaskController.swift
//  Notifications (Homework)
//
//  Created by Ivan Kuzmenkov on 6.12.22.
//

import UIKit

class TaskController: UIViewController {

    private var tasks: [TaskModel] = RealmManager<TaskModel>().read() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tasks = RealmManager<TaskModel>().read()
        print(tasks)
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var addTaskButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addTaskButton)
            registerCells()
    }
    
    private func registerCells() {
        let nib = UINib(nibName: TaskCell.id, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TaskCell.id)
    }
    
    @IBAction func addTaskAction(_ sender: Any) {
        let vc = CreateTaskController(nibName: String(describing: CreateTaskController.self), bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension TaskController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.id, for: indexPath)
        guard let cell = cell as? TaskCell else { return cell }
        cell.label.text = tasks[indexPath.row].listName
        cell.dateLabel.text = "\(tasks[indexPath.row].date.formatted())"
        return cell
    }
}


extension TaskController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
