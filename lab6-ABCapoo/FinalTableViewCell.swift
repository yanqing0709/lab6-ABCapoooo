//
//  FinalTableViewCell.swift
//  lab6-ABCapoo
//
//  Created by 陳嬿晴 on 2019/6/19.
//  Copyright © 2019 陳嬿晴. All rights reserved.
//

import UIKit

class FinalTableViewCell: UITableViewCell {

    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var isCorrectLabel: UILabel!
    @IBOutlet weak var isCorrectImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
