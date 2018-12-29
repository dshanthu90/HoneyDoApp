//
//  Storage.swift
//  HoneyDoApp
//
//  Created by Senthil Kumar Ramakrishnan on 12/27/18.
//  Copyright © 2018 Shanthini Inc. All rights reserved.
//

import UIKit

class Storage: NSObject {

    static var userIdMap = ["Shanthini": "1", "Senthil": "2"];
    static var selectedUserId = ["userId": "1"];
    static var selectedUserName = ["name": ""];
    static var isMyTask = true
    
    static var myTaskLists = [
        "1": "{\"tasks\":[{\"id\": \"1234\", \"taskName\": \"Splunk it!\", \"assignedTo\": \"1\", \"date\": \"01/01/2019\"}, {\"id\": \"1235\", \"taskName\": \"Complete Services\", \"assignedTo\": \"1\", \"date\": \"01/01/2019\"}, {\"id\": \"1236\", \"taskName\": \"Give Demo\", \"assignedTo\": \"1\", \"date\": \"01/01/2019\"}]}",
        "2": "{\"tasks\":[{\"id\": \"2345\", \"taskName\": \"Play tennis\", \"assignedTo\": \"2\", \"date\": \"01/01/2019\"}]}"
    ]

    static var allTaskLists = "{\"tasks\":[{\"id\": \"1234\", \"taskName\": \"Splunk it!\", \"assignedTo\": \"1\", \"date\": \"01/01/2019\"}, {\"id\": \"1235\", \"taskName\": \"Complete Services\", \"assignedTo\": \"1\", \"date\": \"01/01/2019\"}, {\"id\": \"1236\", \"taskName\": \"Give Demo\", \"assignedTo\": \"1\", \"date\": \"01/01/2019\"}, {\"id\": \"2345\", \"taskName\": \"Play tennis\", \"assignedTo\": \"2\", \"date\": \"01/01/2019\"}]}"
}
