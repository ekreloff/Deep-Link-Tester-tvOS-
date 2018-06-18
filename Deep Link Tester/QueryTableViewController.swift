//
//  QueryTableViewController.swift
//  Deep Link Tester
//
//  Created by Ethan Kreloff on 6/18/18.
//  Copyright © 2018 Ethan Kreloff. All rights reserved.
//

import UIKit

class QueryTableViewController: UITableViewController {
    var cellCount = 1 {
        didSet {
            tableView.reloadData()
        }
    }

    var queryString: String {
        var queryString = String()
        var numberOfParameters = 0

        for index in 0..<tableView.numberOfRows(inSection: 0) {
            let indexPath = IndexPath(row: index, section: 0)

            if let cell = tableView.cellForRow(at: indexPath) as? QueryTableViewCell {
                if let key = cell.keyTextField.text, !key.isEmpty,
                    let value = cell.valueTextField.text, !value.isEmpty {
                    queryString += "\(key)=\(value)&"
                    numberOfParameters += 1
                }
            }
        }

        return numberOfParameters > 0 ? "?\(queryString.dropLast())" : ""
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: QueryTableViewCell.self), for: indexPath)

        return cell
    }
}
