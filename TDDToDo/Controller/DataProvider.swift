//
//  DataProvider.swift
//  TDDToDo
//
//  Created by Natalia Kazakova on 11/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import UIKit

class DataProvider: NSObject {
    
}

//MARK: - UITableViewDelegate
/***************************************************************/

extension DataProvider: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
/***************************************************************/

extension DataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
