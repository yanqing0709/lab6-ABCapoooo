//
//  ShowResultTableViewCell.swift
//  lab6-ABCapoo
//
//  Created by 陳嬿晴 on 2019/6/19.
//  Copyright © 2019 陳嬿晴. All rights reserved.
//

import UIKit

class ShowResultTableViewCell: UITableViewCell {

    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var correctNumLabel: UILabel!
    @IBOutlet weak var falseNumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
