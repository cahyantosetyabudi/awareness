//
//  SpiritTableViewCell.swift
//  awareness
//
//  Created by Cahyanto Setya Budi on 11/8/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class SpiritTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var CategoryLabel: UILabel!
    @IBOutlet weak var AboutLabel: UILabel!
    @IBOutlet weak var ByLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var saveImage: UIImageView!
    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        circularView.layer.borderWidth = 1
        circularView.layer.masksToBounds = false
        circularView.layer.borderColor = UIColor.white.cgColor
        circularView.layer.cornerRadius = circularView.frame.width/2
        circularView.clipsToBounds = true
        
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        profileImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
