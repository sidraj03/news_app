//
//  TableViewCell.swift
//  newsy
//
//  Created by Sidharth  Miglani on 3/2/19.
//  Copyright © 2019 Sidharth  Miglani. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    
    @IBOutlet var cont: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
