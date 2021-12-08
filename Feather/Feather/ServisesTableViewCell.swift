//
//  ServisesTableViewCell.swift
//  Feather
//
//  Created by موضي الحربي on 03/05/1443 AH.
//

import UIKit

class ServisesTableViewCell: UITableViewCell {

    @IBOutlet weak var imgServicePhoto: UIImageView!
   
    @IBOutlet weak var lablelService: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
