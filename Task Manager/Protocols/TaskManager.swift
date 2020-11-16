//
//  TaskManager.swift
//  Task Manager
//
//  Created by Федор Филимонов on 15.11.2020.
//

import UIKit

protocol TaskManager {
    var name: String { get set }
}

class Task: TaskManager {
    var name: String
    var subTasks: [TaskManager] = []

    init(name: String) {
        self.name = name
    }
}
