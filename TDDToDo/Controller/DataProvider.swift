//
//  DataProvider.swift
//  TDDToDo
//
//  Created by Natalia Kazakova on 11/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import UIKit

enum Section: Int, CaseIterable {
    case todo
    case done
}

class DataProvider: NSObject {
    var taskManager: TaskManager?
}

//MARK: - UITableViewDelegate
/***************************************************************/

extension DataProvider: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
/***************************************************************/

extension DataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { fatalError() }
        guard let taskManager = taskManager else { return 0}
        
        switch section {
        case .todo:
            return taskManager.tasksCount
        case .done:
            return taskManager.doneTasksCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: indexPath) as! TaskCell
        
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        guard let taskManager = taskManager else { fatalError() }
        
        let task: Task
        switch section {
        case .todo: task = taskManager.task(at: indexPath.row)
        case .done: task = taskManager.doneTask(at: indexPath.row)
        }
        
        cell.configure(withTask: task)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
}
