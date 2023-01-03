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
        imageResume.layer.cornerRadius = 40
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(item:RegisterList){
        self.addressLabel.text =  self.getAddress(data: item)
        self.fullNameLabel.text = self.getFullName(data: item)
        self.emailLabel.text = item.email ?? ""
        self.phoneNumberLabel.text = item.phoneNo ?? ""
        self.designnationLabel.text = item.designation ?? ""
        setUserProfileImage(data: item)
    }
    private func getAddress(data:RegisterList) -> String {
        let state = data.state ?? ""
        let city = data.city ?? ""
        let address = data.address ?? ""
        let landmark = data.landmark ?? ""
        let pincode = data.pincode ?? ""
        return "\(address), \(landmark), \(city), \(state), \(pincode) "
    }
    private func getFullName(data:RegisterList) -> String {
        return "\(data.firstName ?? "") \(data.lastName ?? "") "
    }
    private func setUserProfileImage(data:RegisterList) {
        if let resumeImage = data.image {
            self.imageResume.image = UIImage(data:resumeImage)
        }
        else{
            self.imageResume.image = UIImage(named:"user 1")
        }
    }
}
