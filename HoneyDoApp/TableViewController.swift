//
//  TabBarController.swift
//  HoneyDoApp
//
//  Created by Senthil Kumar Ramakrishnan on 12/28/18.
//  Copyright © 2018 Shanthini Inc. All rights reserved.
//

import Foundation
import UIKit

struct Tasks: Decodable {
    let tasks:[Task]
}

struct Task: Decodable {
    let id: String
    let taskName: String
    let assignedTo: String
    let date: String
}

class TableViewController: UITableViewController {

    var currentTab = "My"
    var webServiceUrl = ""
    var tasks: [Task]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currentTab = "My"

        if let selectedUserId = Storage.selectedUserId["userId"] {
            print("Selected UserId=\(selectedUserId)")
            
            fetchTasks(userId: selectedUserId)
            print("Loading tasks for \(selectedUserId)")
            
            print("JSON deserialization in progress")
//            let obj = try? JSONSerialization.jsonObject(with: response.data(using: .utf8) ?? Data(), options: [])
            
        } else {
            print("No user selected")
            // TODO - alert and go back when hit ok.
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    @IBAction func onButtonClick(_ sender: UIButton) {
        if let selectedButton = sender.titleLabel?.text {
            print("Selected button \(selectedButton) \(sender.tag)")
            if (selectedButton == "Create") {
                print("Load Create Task Controller")
                self.performSegue(withIdentifier: "ToCreateTasks", sender: self)
            } else {
                print("Load current controller for \(selectedButton)")
                if (currentTab != selectedButton) {
                    let response = ""
                    var url = webServiceUrl
                    // TODO fetch Tasks (filtered / not-filtered)
                    if (selectedButton == "My") {
                        let userId = Storage.selectedUserId["userId"]
                        print("Fetching \(selectedButton) tasks for userId=\(String(describing: userId))")
                        currentTab = "My"
                        url = url + "?userId=\(String(describing: userId))"
                        fetchTasks(userId: userId ?? "")
                    } else {
                        print("Fetching \(selectedButton) tasks")
                        currentTab = "All"
                        fetchTasks(userId: "")
                    }
                    print("WS url=\(url) \n returned response=\(response)")
                    // TODO user HTTP Client libraries to make WS call.
                    self.tableView.reloadData()
                } else {
                    print("Current tab selected. No action required")
                }
            }
        } else {
            print("No button selected")
        }
    }

    func fetchTasks(userId: String) {
        var response = ""
        if let value = Storage.myTaskLists["\(userId)"] {
            response = value
        } else {
            response = Storage.allTaskLists
        }
        do {
            let decoder = JSONDecoder()
            let tasks = try decoder.decode(Tasks.self, from: response.data(using: .utf8) ?? Data())
            print("Total tasks \(tasks.tasks.count)")
            self.tasks = tasks.tasks
        } catch let error {
            print(error)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("Invoked nubmer of Sections")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("Invoked nubmer of rows in section")
        return self.tasks?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        print("Setting values in the cell - Value \(indexPath.item)")
        // Configure the cell...
        if let desc = self.tasks?[indexPath.item].taskName {
            cell.textLabel?.text = desc;
        } else {
            cell.textLabel?.text = "Value \(indexPath.item)";
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
