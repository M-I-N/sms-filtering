//
//  AddNumberViewController.swift
//  MessageFilter
//
//  Created by Nayem BJIT on 4/19/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import UIKit

class AddNumberViewController: UIViewController {
    @IBOutlet private weak var phoneNumberTextField: UITextField!

    var stateController: StateController!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SaveNumberSegue" else {
            return
        }
        let number = phoneNumberTextField.text ?? ""
        // save this word to storage using state controller
        stateController.add(number: number)
    }

}
