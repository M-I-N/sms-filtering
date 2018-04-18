//
//  FilterWordsTableViewDataSource.swift
//  MessageFilter
//
//  Created by Nayem BJIT on 4/18/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import UIKit

class FilterWordsTableViewDataSource: NSObject {
    let words: [String]
    init(words: [String]) {
        self.words = words
    }
}

extension FilterWordsTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: FilterWordsTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FilterWordsTableViewCell
        let word = words[indexPath.row]
        cell.viewModel = FilterWordsTableViewCell.ViewModel(word: word)
        return cell
    }
}
