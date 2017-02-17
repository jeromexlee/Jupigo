//
//  TableViewControllerTableViewCell.swift
//  Jupigo
//
//  Created by XINHAO LI on 2/17/17.
//  Copyright © 2017 XINHAO LI. All rights reserved.
//

import UIKit

class TableViewControllerTableViewCell: UITableViewCell {
  @IBOutlet weak var iconImage: UIImageView!
  @IBOutlet weak var color: UILabel!
  @IBOutlet weak var dateString: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
