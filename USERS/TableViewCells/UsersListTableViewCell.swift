//
//  UsersListTableViewCell.swift
//  USERS
//
//  Created by webwerks on 23/12/22.
//

import UIKit

class UsersListTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userAddress: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var btnArrow: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
