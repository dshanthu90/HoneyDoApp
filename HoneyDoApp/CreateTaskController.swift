//
//  TabBarController.swift
//  HoneyDoApp
//
//  Created by Senthil Kumar Ramakrishnan on 12/28/18.
//  Copyright © 2018 Shanthini Inc. All rights reserved.
//

import UIKit

class CreateTaskController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("CreateTaskController controller")
    }
    
    @IBAction func onCloseCreateTask(_ sender: UIButton) {
        print("Closing Create Task view")
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
