//
//  Contact.swift
//  UITableViewDemo
//
//  Created by jiangchao on 15/12/28.
//  Copyright © 2015年 jiangchao. All rights reserved.
//

import UIKit

class Contact {
    
    var firstName: String
    var lastName: String
    var phoneNumber: String?
    
    var name: String {
        return self.lastName + " " + self.firstName
    }
    
    init(firstName:String, lastName:String, phoneNumber:String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
}
