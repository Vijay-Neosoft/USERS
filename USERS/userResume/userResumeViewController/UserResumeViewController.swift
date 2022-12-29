//
//  UserResumeViewController.swift
//  USERS
//
//  Created by webwerks on 28/12/22.
//

import UIKit

class UserResumeViewController: UIViewController {
    
    @IBOutlet weak var userTable: UITableView!
    
    @IBOutlet weak var buttonTodismiss: UIButton!
    var userData = RegisterList()
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userTable.dataSource = self
        self.userTable.delegate = self
        
        print("Resume data", userData)
    }
    
    @IBAction func buttonToDismiss(_ sender: Any) {
        if((self.presentingViewController) != nil){
            self.dismiss(animated: false, completion: nil)
            print("done")
        }
    }
}

extension UserResumeViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let basicInfoCell = tableView.dequeueReusableCell(withIdentifier: "BasicInfo", for: indexPath) as! BasicInfoTableViewCell
            
            basicInfoCell.fullNameLabel.text = "\(userData.firstName ?? "") \(userData.lastName ?? "")"
            basicInfoCell.emailLabel.text = userData.email ?? ""
            basicInfoCell.phoneNumberLabel.text = userData.phoneNo ?? ""
            basicInfoCell.designnationLabel.text = userData.designation
            basicInfoCell.addressLabel.text = userData.address
            basicInfoCell.imageResume.image = UIImage(named:"user")
            return basicInfoCell
        }
        else if indexPath.row == 1{
            let eduInfoCell = tableView.dequeueReusableCell(withIdentifier: "EduInfo", for: indexPath) as! EducationalInfoTableViewCell
            
            eduInfoCell.graduatelLabel.text = userData.domain ?? ""
            eduInfoCell.cgpaLabel.text = userData.grade
            eduInfoCell.passingYear.text = userData.yearOfPassing
            
            return eduInfoCell
        }
        else if indexPath.row == 2 {
            let profInfoCell = tableView.dequeueReusableCell(withIdentifier: "ProfInfo", for: indexPath) as! ProfessionalInfoTableViewCell
            
            profInfoCell.experiance.text = userData.experiance
            profInfoCell.department.text = userData.domain
            
            return profInfoCell
            
        }
        return UITableViewCell()
        
    }
    
    
    
    
}
