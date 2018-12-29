//
//  TaskListController.swift
//  HoneyDoApp
//
//  Created by Senthil Kumar Ramakrishnan on 12/26/18.
//  Copyright © 2018 Shanthini Inc. All rights reserved.
//

import UIKit

class TaskListController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded Tasks lists controller View")

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onClick(_ sender: Any) {
        
        print("Inside Tasks lists controlle")
        self.dismiss(animated: true, completion: nil)
    }
}
