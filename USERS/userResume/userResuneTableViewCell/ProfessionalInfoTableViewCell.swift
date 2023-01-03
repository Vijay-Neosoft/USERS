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
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setProfInfo(item:RegisterList){
        self.experiance.text = "\(item.experiance ?? "") year of experiance "
        self.department.text = "\(item.domain ?? "") Department "
    }
}
