//
//  TaskListTableViewController.swift
//  Task_v2
//
//  Created by Taylor Bills on 2/1/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    // MARK: -  Properties
    
    // MARK: -  Life Cycles
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: -  Table View Data Source Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.shared.tasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = TaskController.shared.tasks[indexPath.row]
        cell.textLabel?.text = task.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let taskToRemove = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.delete(task: taskToRemove)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: -  Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaskDetailVC" {
            guard let toTaskDetailVC = segue.destination as? TaskDetailTableViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let task = TaskController.shared.tasks[indexPath.row]
            toTaskDetailVC.dueDateValue = task.due
            toTaskDetailVC.task = task
        }
    }
}
