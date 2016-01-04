//
//  Status.swift
//  UITableViewDemo
//
//  Created by jiangchao on 15/12/30.
//  Copyright © 2015年 jiangchao. All rights reserved.
//

import UIKit

class Status {
    
    var Id: Int
    var profileImageUrl: String?
    var userName: String?
    var mbtype: String?
    var createdAt: String?
    var source: String?
    var text: String?
    
    var Source: String {
        return  "来自" + self.source!
    }
    
    init(dicSource: Dictionary<String, String>) {
        self.Id = ((dicSource["Id"])! as NSString).integerValue
        self.profileImageUrl = dicSource["profileImageUrl"]
        self.userName = dicSource["userName"]
        self.mbtype = dicSource["mbtype"]
        self.createdAt = dicSource["createdAt"]
        self.source = dicSource["source"]
        self.text = dicSource["text"]
    }
}
