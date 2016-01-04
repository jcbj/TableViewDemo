//
//  StatusTableViewCell.swift
//  UITableViewDemo
//
//  Created by jiangchao on 15/12/30.
//  Copyright © 2015年 jiangchao. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var contentText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    //iOS7之前版本需要设置Label的preferredMaxLayoutWidth才能自动换行
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        self.contentText.preferredMaxLayoutWidth = self.contentText.bounds.size.width
//    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(status: Status) {
        self.userImage.image = UIImage(named: status.profileImageUrl!)
        self.userLabel.text = status.userName
        self.typeImage.image = UIImage(named: status.mbtype!)
        self.createdAtLabel.text = status.createdAt
        self.sourceLabel.text = status.Source
        self.contentText.text = status.text
    }
    
}
