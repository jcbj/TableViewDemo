//
//  MainTableViewController.swift
//  UITableViewDemo
//
//  Created by jiangchao on 15/12/28.
//  Copyright © 2015年 jiangchao. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var contactStore: ContactStore = ContactStore.Instance

    override func viewDidLoad() {
        super.viewDidLoad()

        contactStore.initData()
        
        self.tableView.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //cell重用
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "ContactCell")
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath)
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.phoneNumber
        
        return cell
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
