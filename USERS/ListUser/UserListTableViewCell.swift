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
        let  state = item.state ?? ""
        let city = item.city ?? ""
        userAddress.text = "\(city), \(state) "
        userImage.layer.cornerRadius = 30
        
        userName.text = item.firstName
        if let profImage = item.image {
            print(profImage)
            userImage.image = UIImage(data: profImage)
        } else  {
            userImage.image = UIImage(named : "user 1")
        }
    }
}
