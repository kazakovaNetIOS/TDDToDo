//
//  DataProviderTests.swift
//  TDDToDoTests
//
//  Created by Natalia Kazakova on 11/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import XCTest
@testable import TDDToDo

class DataProviderTests: XCTestCase {

    var sut: DataProvider!
    var tableView: UITableView!
    
    override func setUp() {
        sut = DataProvider()
        sut.taskManager = TaskManager()
        tableView = UITableView()
        tableView.dataSource = sut
    }

    override func tearDown() {
        sut = nil
        tableView = nil
    }
    
    func testNumberOfSectionsIsTwo() {
        XCTAssertEqual(tableView.numberOfSections, 2)
    }
    
    func testNumberOfRowsInSectionZeroIsTasksCount() {
        sut.taskManager?.add(task: Task(title: "Foo"))
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.taskManager?.add(task: Task(title: "Bar"))
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testNumberOfRowsInSectionOneIsDoneTasksCount() {
        sut.taskManager?.add(task: Task(title: "Foo"))
        sut.taskManager?.checkTask(at: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        sut.taskManager?.add(task: Task(title: "Bar"))
        sut.taskManager?.checkTask(at: 0)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    func testCellForRowAtIndexPathReturnsTaskCell() {
        sut.taskManager?.add(task: Task(title: "Foo"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is TaskCell)
    }
}
