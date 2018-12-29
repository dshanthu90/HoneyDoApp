//
//  ViewController.swift
//  HoneyDoApp
//
//  Created by Senthil Kumar Ramakrishnan on 12/26/18.
//  Copyright © 2018 Shanthini Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let userId = Storage.selectedUserId["userId"] {
            print("Selected userId \(userId)")
        } else {
            print("No UserId defined")
        }
        if let userName = Storage.selectedUserName["name"] {
            print("Selected userName \(userName)")
        } else {
            print("No UserName defined")
        }
    }

    @IBAction func onSelect(_ sender: UIButton) {

        if let selectedUser = sender.titleLabel?.text {

            let userId = Storage.userIdMap[selectedUser]
            Storage.selectedUserId["userId"] = userId
            Storage.selectedUserName["name"] = selectedUser

            print("Selected user \(selectedUser)'s id=\(String(describing: userId))")

            self.performSegue(withIdentifier: "ToTasks", sender: self)
        } else {
            print("No user selected. Show alert")

            let alertController = UIAlertController(title: "User Error", message: "Select a User", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

