//
//  FilterNumbersViewController.swift
//  MessageFilter
//
//  Created by Nayem BJIT on 4/19/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import UIKit

class FilterNumbersViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    var stateController: StateController!
    private var dataSource: FilterNumbersTableViewDataSource!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = FilterNumbersTableViewDataSource(numbers: stateController.numbers)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "AddNumberSegue":
            if let navigationController = segue.destination as? UINavigationController, let addNumberViewController = navigationController.viewControllers.first as? AddNumberViewController {
                addNumberViewController.stateController = stateController
            }
        default:
            break
        }
    }

    @IBAction func cancelAddNumber(_ segue: UIStoryboardSegue) {}
    @IBAction func saveNumber(_ segue: UIStoryboardSegue) {}

}
