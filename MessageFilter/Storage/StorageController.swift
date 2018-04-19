//
//  StorageController.swift
//  MessageFilter
//
//  Created by Nayem BJIT on 4/18/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import Foundation

class StorageController {
    let userDefaults = UserDefaults(suiteName: Constants.userDefaultsSuiteKey)!

    func save(wordFilter: WordFilter) {
        let encoder = JSONEncoder()
        do {
            let encodedFilter = try encoder.encode(wordFilter)
            userDefaults.set(encodedFilter, forKey: Constants.wordsFilterUserDefaultsKey)
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func save(numberFilter: NumberFilter) {
        let encoder = JSONEncoder()
        do {
            let encodedFilter = try encoder.encode(numberFilter)
            userDefaults.set(encodedFilter, forKey: Constants.numbersFilterUserDefaultsKey)
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func fetchWordFilter()-> WordFilter? {
        if let data = userDefaults.data(forKey: Constants.wordsFilterUserDefaultsKey) {
            let decoder = JSONDecoder()
            do {
                let decodedFilter = try decoder.decode(WordFilter.self, from: data)
                return decodedFilter
            } catch {
                print(error.localizedDescription)
                return nil
            }
        } else {
            print("No initial words for filtering exists")
            return nil
        }
    }

    func fetchNumberFilter()-> NumberFilter? {
        if let data = userDefaults.data(forKey: Constants.numbersFilterUserDefaultsKey) {
            let decoder = JSONDecoder()
            do {
                let decodedFilter = try decoder.decode(NumberFilter.self, from: data)
                return decodedFilter
            } catch {
                print(error.localizedDescription)
                return nil
            }
        } else {
            print("No initial numbers for filtering exists")
            return nil
        }
    }

}
