//
//  UserTableViewCell.swift
//  UIAlertController
//
//  Created by jiang on 2018/11/19.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var passWord: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var images: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
