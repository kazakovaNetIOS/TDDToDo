//
//  DataProvider.swift
//  TDDToDo
//
//  Created by Natalia Kazakova on 11/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import UIKit

enum Section: Int {
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
        return TaskCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
