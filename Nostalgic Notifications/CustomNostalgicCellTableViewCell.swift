//
//  CustomNostalgicCellTableViewCell.swift
//  Nostalgic Notifications
//
//  Created by Laurence Wingo on 5/31/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit

class CustomNostalgicCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet var appIconImage: UIImageView!
    @IBOutlet var appTitleLabel: UILabel!
    @IBOutlet var appReleaseDateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
