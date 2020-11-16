//
//  SubTasksTableViewController.swift
//  Task Manager
//
//  Created by Федор Филимонов on 16.11.2020.
//

import UIKit

class SubTasksTableViewController: UIViewController {

    var tasks: [Task] = [
    ]
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func addTask(_ sender: Any) {
        
        var newTask = Task(name: "Task")
        
        let alert = UIAlertController(title: "Add a new task", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Task"
        }
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak alert] (_) in
            
            let textField = alert?.textFields![0]
            
            guard textField != nil else {
                print("No task was added")
                return
            }
            
            newTask.name = (textField?.text)!
            
            self.tasks.append(newTask)
            self.tableView.reloadData()
            
        }))

        self.present(alert, animated: true, completion: nil)
        
    }
}
        
extension SubTasksTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard tasks.count > 0 else {
            return 1
        }
        return tasks.count
    }
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubTaskTableViewCell", for: indexPath) as! SubTaskTableViewCell
        
        guard tasks.first != nil else {
            cell.task.text = "No tasks"
            cell.subtasksNumber.text = ""
            return cell
        }
        
        cell.task.text = tasks[indexPath.row].name
        cell.subtasksNumber.text = String(tasks[indexPath.row].subTasks.count)

        return cell
    }
}

