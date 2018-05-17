//
//  FilterNumbersTableViewDataSource.swift
//  MessageFilter
//
//  Created by Nayem BJIT on 4/19/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import UIKit

class FilterNumbersTableViewDataSource: NSObject {
    let numbers: [String]
    init(numbers: [String]) {
        self.numbers = numbers
    }
}

extension FilterNumbersTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: FilterNumbersTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FilterNumbersTableViewCell
        let number = numbers[indexPath.row]
        cell.viewModel = FilterNumbersTableViewCell.ViewModel(number: number)
        return cell
    }
}
