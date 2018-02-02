//
//  TaskDetailTableViewController.swift
//  Task_v2
//
//  Created by Taylor Bills on 2/1/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    // MARK: -  Properties
    
    var task: Task? {
        didSet {
            if task != nil {
                updateViews()
            }
        }
    }
    
    var dueDateValue: Date?
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet var datePicker: UIDatePicker!
    
    // MARK: -  Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        dueDateTextField.inputView = datePicker
    }
    
    // MARK: -  Actions
    
    // Save Button Tapped
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = taskNameTextField.text, !name.isEmpty,
            let notes = taskNotesTextView.text,
            let due = dueDateValue else { return }
        if let task = task {
            TaskController.shared.updateExisting(task: task, name: name, notes: notes, due: due)
        } else {
            TaskController.shared.add(taskWithName: name, notes: notes, due: due)
        }
        navigationController?.popViewController(animated: true)
    }
    
    // Date Picker Value Changed
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateTextField.text = datePicker.date.stringValue()
    }
    
    // User tapped view
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
        taskNameTextField.resignFirstResponder()
        taskNotesTextView.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
    }
    
    // MARK: -  Update Views
    
    func updateViews() {
            if isViewLoaded {
                taskNameTextField.text = task?.name
                taskNotesTextView.text = task?.notes
                dueDateTextField.text = task?.due?.stringValue()
        }
    }
}
