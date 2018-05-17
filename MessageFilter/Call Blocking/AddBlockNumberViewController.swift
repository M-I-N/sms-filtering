//
//  AddBlockNumberViewController.swift
//  MessageFilter
//
//  Created by Nayem BJIT on 5/15/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import UIKit
import CallKit

class AddBlockNumberViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!

    var stateController: StateController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SaveBlockingNumberSegue" else {
            return
        }
        let name = nameTextField.text ?? ""
        let phoneNumber = phoneNumberTextField.text ?? ""
        if let validPhoneNumber = CXCallDirectoryPhoneNumber(phoneNumber) {
            var callBlock: CallBlock
            if name.isEmpty {
                callBlock = CallBlock(phoneNumber: validPhoneNumber)
            } else {
                callBlock = CallBlock(name: name, phoneNumber: validPhoneNumber)
            }
            stateController.add(callBlock: callBlock)
        }
    }

}
