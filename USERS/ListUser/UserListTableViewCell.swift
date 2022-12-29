//
//  UserListTableViewCell.swift
//  USERS
//
//  Created by webwerks on 25/12/22.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    @IBOutlet weak var nextUIbutton: UIButton!
    @IBOutlet weak var userAddress: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setData(item:RegisterList) {
        userAddress.text = item.city
        
        userName.text = item.firstName
        userImage.image = UIImage(named:"user")
    }
    
}
