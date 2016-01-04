//
//  MainTableViewController.swift
//  UITableViewDemo
//
//  Created by jiangchao on 15/12/28.
//  Copyright © 2015年 jiangchao. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController,UIAlertViewDelegate {
    
    static let ContactCell: String = "ContactCell"
    static let FirstCell: String = "FirstCell"
    
    var contactStore: ContactStore = ContactStore.Instance
    var currentSelectIndexPath: NSIndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()

        contactStore.initData()
        
        self.tableView.dataSource = self
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: MainTableViewController.ContactCell)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: MainTableViewController.FirstCell)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        print("计算分组数")
        
        return contactStore.contactGroups.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        print("计算每组(组\(section))行数")
        
        let group = contactStore.contactGroups[section]
        
        return group.contacts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("生成单元格(组:\(indexPath.section),行:\(indexPath.row))")
        
        let contact = contactStore.contactGroups[indexPath.section].contacts[indexPath.row]
        
        var cell: UITableViewCell?
        
        if 0 == indexPath.row {
            cell = self.tableView.dequeueReusableCellWithIdentifier(MainTableViewController.FirstCell)
        } else {
            cell = self.tableView.dequeueReusableCellWithIdentifier(MainTableViewController.ContactCell)
        }
        
        if cell == nil {
            if 0 == indexPath.row {
                cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: MainTableViewController.FirstCell)
                
                let tempSwitch = UISwitch()
                tempSwitch.addTarget(self, action: Selector("switchValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
                
                cell?.accessoryView = tempSwitch
                
            } else {
                
                cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: MainTableViewController.ContactCell)
                cell?.accessoryType = UITableViewCellAccessoryType.DetailButton
            }
        }
        
        if 0 == indexPath.row {
            cell?.accessoryView?.tag = indexPath.section
        }
        
        cell!.textLabel?.text = contact.name
        cell!.detailTextLabel?.text = contact.phoneNumber
        
        return cell!
    }
    
    func switchValueChanged(btnSwitch: UISwitch) {
        print("section:\(btnSwitch.tag),switch:\(btnSwitch.on)")
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("生成组(组\(section))名称")
        
        return contactStore.contactGroups[section].name
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        print("生成尾部(组\(section))详情")
        
        return contactStore.contactGroups[section].detail
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        print("生成组索引")
        
        return contactStore.contactGroups.map({
            group in
            return group.name
        })
    }
    
    //设置分组标题高度
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if 0 == section {
            return 50
        } else {
            return 44
        }
    }
    
    //设置每行高度
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    //设置分组尾部说明高度
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44
    }
    
    //deprecated
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentSelectIndexPath = indexPath
        
        let contact = contactStore.contactGroups[self.currentSelectIndexPath.section].contacts[self.currentSelectIndexPath.row]
        
        let alertView = UIAlertView(title: "Edit contact", message: contact.name, delegate: self,
            cancelButtonTitle: "Cancel", otherButtonTitles: "Ok")
        
        alertView.alertViewStyle = UIAlertViewStyle.PlainTextInput
        let textField = alertView.textFieldAtIndex(0)
        textField?.text = contact.phoneNumber
        
        alertView.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if 1 == buttonIndex {
            let textField = alertView.textFieldAtIndex(0)
            let contact = contactStore.contactGroups[self.currentSelectIndexPath.section].contacts[self.currentSelectIndexPath.row]
            contact.phoneNumber = textField?.text
            //全部重新加载数据，对性能影响很大
//            self.tableView.reloadData()
            //只更新局部单条记录
            self.tableView.reloadRowsAtIndexPaths([self.currentSelectIndexPath], withRowAnimation: UITableViewRowAnimation.Left)
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
