//
//  IssueTableViewCell.swift
//  GitHub Issues
//
//  Created by Shuaib Ahmed on 1/29/16.
//  Copyright © 2016 Shuaib Labs. All rights reserved.
//

import UIKit

class IssueTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var issueNameLabel: UILabel!
    @IBOutlet weak var posterIDLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
