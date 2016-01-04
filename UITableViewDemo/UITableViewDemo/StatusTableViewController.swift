//
//  StatusTableViewController.swift
//  UITableViewDemo
//
//  Created by jiangchao on 15/12/30.
//  Copyright © 2015年 jiangchao. All rights reserved.
//

import UIKit

class StatusTableViewController: UITableViewController {
    
    static let StatusCell = "StatusCell"
    
    var status: [Status] = [Status]()
    var statusCellsDic: [Int : StatusTableViewCell] = [Int : StatusTableViewCell]()
    
    var heightCell: StatusTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initData()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nib = UINib(nibName: "StatusTableViewCell", bundle: nil)
        
        self.tableView.registerNib(nib, forCellReuseIdentifier: StatusTableViewController.StatusCell)
        
        self.heightCell = self.tableView.dequeueReusableCellWithIdentifier(StatusTableViewController.StatusCell) as! StatusTableViewCell
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func initData() {
        if let filePath = NSBundle.mainBundle().pathForResource("StatusInfo", ofType: "plist") {
            if let items = NSArray(contentsOfFile: filePath) {
                
                self.status = items.map({ item -> Status in
                    return Status(dicSource: item as! Dictionary<String, String>)
                })
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.status.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(StatusTableViewController.StatusCell, forIndexPath: indexPath) as! StatusTableViewCell
        
        cell.setData(self.status[indexPath.row])
        
        self.statusCellsDic[indexPath.row] = cell
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if  indexPath.row < self.status.count {
            let heightCell = self.heightCell
            let cellData = self.status[indexPath.row]
            
            heightCell.setData(cellData)
            heightCell.layoutSubviews()
            //此处＋1，是分割线的高度，不加，则label还是无法显示完整。
            return heightCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height + 1
        }
        else {
            return 100
        }
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
