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
    private let storageController: StorageController
    init(storageController: StorageController) {
        self.storageController = storageController
        guard let filter = storageController.fetchFilter() else {
            words = addDefaultFilter().words
            return
        }
        words = filter.words
    }

    private func addDefaultFilter()-> Filter {
        let filter = Filter(words: ["offer", "register", "subscribe"])
        storageController.save(filter: filter)
        return filter
    }

    func add(word: String) {
        if !word.isEmpty {
            words.append(word)
            // create new filter object with this updated words list
            let filter = Filter(words: words)
            storageController.save(filter: filter)
        }
    }
}
