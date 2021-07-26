//
//  DemoTableViewCell.swift
//  DemoTableViewCell
//
//  Created by Wolfpack Digital on 26.07.2021.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    
    @IBOutlet var myLabel : UILabel!
    @IBOutlet var myImageView : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
