//
//  ProfessionalInfoTableViewCell.swift
//  USERS
//
//  Created by webwerks on 28/12/22.
//

import UIKit

class ProfessionalInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var profInfoIabel: UILabel!
    
    @IBOutlet weak var experiance: UILabel!
    @IBOutlet weak var department: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
