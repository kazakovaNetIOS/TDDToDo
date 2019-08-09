//
//  TaskManagerTests.swift
//  TDDToDoTests
//
//  Created by Natalia Kazakova on 10/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import XCTest
@testable import TDDToDo

class TaskManagerTests: XCTestCase {

    var sut: TaskManager!
    
    override func setUp() {
        super.setUp()
        sut = TaskManager()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInitTaskManagerWithZeroTasks() {
        sut = TaskManager()
        
        XCTAssertEqual(sut.tasksCount, 0)
    }
    
    func testInitTaskManagerWithZeroDoneTasks() {
        sut = TaskManager()
        
        XCTAssertEqual(sut.doneTasksCount, 0)
    }
    
    func testAddTaskIncrementTasksCount() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        XCTAssertEqual(sut.tasksCount, 1)
    }
    
    func testTaskAtIndexIsAddedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        let returnedTask = sut.task(at: 0)
        
        XCTAssertEqual(task.title, returnedTask.title)
    }
    
    func testCheckTaskAtIndexChangesCounts() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.tasksCount, 0)
        XCTAssertEqual(sut.doneTasksCount, 1)
    }
    
    func testCheckedTaskRemovedFromTasks() {
        let firstTask = Task(title: "Foo")
        let secondTask = Task(title: "Bar")
        sut.add(task: firstTask)
        sut.add(task: secondTask)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.task(at: 0).title, "Bar")
    }
    
    func testDoneTaskAtReturnsCheckedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        let returnedTask = sut.doneTask(at: 0)
        
        XCTAssertEqual(task.title, returnedTask.title)
    }
}
