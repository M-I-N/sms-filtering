//
//  StateController.swift
//  MessageFilter
//
//  Created by Nayem BJIT on 4/18/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import Foundation

class StateController {
    private(set) var words = [String]()
    private(set) var numbers = [String]()
    private let storageController: StorageController
    init(storageController: StorageController) {
        self.storageController = storageController

        if let wordFilter = storageController.fetchWordFilter() {
            words = wordFilter.words
        } else {
            words = addDefaultFilter().words
        }
        if let numberFilter = storageController.fetchNumberFilter() {
            numbers = numberFilter.numbers
        }
    }

    private func addDefaultFilter()-> WordFilter {
        let filter = WordFilter(words: ["offer", "register", "subscribe"])
        storageController.save(wordFilter: filter)
        return filter
    }

    func add(word: String) {
        if !word.isEmpty {
            words.append(word)
            // create new filter object with this updated words list
            let filter = WordFilter(words: words)
            storageController.save(wordFilter: filter)
        }
    }

    func add(number: String) {
        if !number.isEmpty {
            let trimmedNumber = number.trimmingCharacters(in: .whitespaces)
            numbers.append(trimmedNumber)
            // create new filter object with this updated numbers list
            let filter = NumberFilter(numbers: numbers)
            storageController.save(numberFilter: filter)
        }
    }
}
