//
//  BlockedListTableViewDataSource.swift
//  MessageFilter
//
//  Created by Nayem BJIT on 5/15/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import UIKit

class BlockedListTableViewDataSource: NSObject {
    let callBlocks: [CallBlock]
    init(callBlocks: [CallBlock]) {
        self.callBlocks = callBlocks
    }
}

extension BlockedListTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return callBlocks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: BlockedListTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! BlockedListTableViewCell
        let callBlock = callBlocks[indexPath.row]
        cell.viewModel = BlockedListTableViewCell.ViewModel(callBlock: callBlock)
        return cell
    }
}
