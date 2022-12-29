//
//  BasicInfoTableViewCell.swift
//  USERS
//
//  Created by webwerks on 28/12/22.
//

import UIKit

class BasicInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var basicInfoLabel: UILabel!
    
    @IBOutlet weak var imageResume: UIImageView!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var designnationLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
