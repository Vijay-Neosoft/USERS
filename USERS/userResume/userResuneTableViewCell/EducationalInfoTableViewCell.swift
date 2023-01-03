//
//  EducationalInfoTableViewCell.swift
//  USERS
//
//  Created by webwerks on 28/12/22.
//

import UIKit

class EducationalInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eduInfoLabel: UILabel!
    
    @IBOutlet weak var graduatelLabel: UILabel!
    
    @IBOutlet weak var passingYear: UILabel!
    
    @IBOutlet weak var cgpaLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setEduData(item:RegisterList){
        self.graduatelLabel.text = item.education ?? ""
        self.cgpaLabel.text =    "Grade/Percentage: \(item.grade ?? "")"
        self.passingYear.text = "YearOfPassing: \(item.yearOfPassing ?? "")"
    }
    
}
