//
//  TaskController.swift
//  Task_v2
//
//  Created by Taylor Bills on 2/1/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    // MARK: -  Properties
    
    static var shared = TaskController()
    var tasks: [Task] = []
    
    // MARK: -  Initializer
    init() {
        self.tasks = fetchTask()
    }
    
    // MARK: -  CRUD
    
    // Add Task
    func add(taskWithName name: String, notes: String?, due: Date?) {
        _ = Task(name: name, notes: notes, due: due)
        saveToPersistence()
    }
    
    // Update Existing Task
    func updateExisting(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistence()
    }
    
    // Delete Task
    func delete(task: Task) {
        task.managedObjectContext?.delete(task)
        saveToPersistence()
    }
    
    // Save to Persistence
    func saveToPersistence() {
        try? CoreDataStack.context.save()
    }
    
    // Load From Persistence
    func fetchTask() -> [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
            do {
                return try CoreDataStack.context.fetch(fetchRequest)
            } catch {
                print(error)
                return []
        }
    }
}
