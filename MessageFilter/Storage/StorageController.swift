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

    func save(filter: Filter) {
        let encoder = JSONEncoder()
        do {
            let encodedFilter = try encoder.encode(filter)
            userDefaults.set(encodedFilter, forKey: Constants.messageFilterUserDefaultsKey)
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func fetchFilter()-> Filter? {
        if let data = userDefaults.data(forKey: Constants.messageFilterUserDefaultsKey) {
            let decoder = JSONDecoder()
            do {
                let decodedFilter = try decoder.decode(Filter.self, from: data)
                return decodedFilter
            } catch {
                print(error.localizedDescription)
                return nil
            }
        } else {
            print("No initial Filter data exists")
            return nil
        }
    }
    
}
