//
//  ContactGroup.swift
//  UITableViewDemo
//
//  Created by jiangchao on 15/12/28.
//  Copyright © 2015年 jiangchao. All rights reserved.
//

import UIKit

class ContactGroup {
    
    var name: String
    var detail: String
    var contacts: [Contact]
    
    init(name: String, detail: String, contacts:[Contact]) {
        self.name = name
        self.detail = detail
        self.contacts = contacts
    }
}
