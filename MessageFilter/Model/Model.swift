//
//  Model.swift
//  MessageFilter
//
//  Created by Nayem BJIT on 4/18/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import Foundation

struct WordFilter: Codable {
    let words: [String]
}

struct NumberFilter: Codable {
    let numbers: [String]
}
