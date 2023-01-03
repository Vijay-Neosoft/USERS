//
//  UserResumeViewController.swift
//  USERS
//
//  Created by webwerks on 28/12/22.
//

import UIKit

class UserResumeViewController: UIViewController {
    //MARK:IB outlets
    @IBOutlet weak var userTable: UITableView!
    @IBOutlet weak var buttonTodismiss: UIButton!
    var userData = RegisterList()
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userTable.dataSource = self
        self.userTable.delegate = self
    }
    
    //MARK: Action Of ButtonToDissmiss
    @IBAction func buttonToDismiss(_ sender: Any) {
        if((self.presentingViewController) != nil){
            self.dismiss(animated: false, completion: nil)
        }
    }
}

//MARK: UITableView DataSource

extension UserResumeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let basicInfoCell = tableView.dequeueReusableCell(withIdentifier: "BasicInfo", for: indexPath) as! BasicInfoTableViewCell
            basicInfoCell.setupData(item:userData)
            return basicInfoCell
        }
        else if indexPath.row == 1{
            let eduInfoCell = tableView.dequeueReusableCell(withIdentifier: "EduInfo", for: indexPath) as! EducationalInfoTableViewCell
            eduInfoCell.setEduData(item:userData)
            return eduInfoCell
        }
        else {
            let profInfoCell = tableView.dequeueReusableCell(withIdentifier: "ProfInfo", for: indexPath) as! ProfessionalInfoTableViewCell
            profInfoCell.setProfInfo(item: userData)
            return profInfoCell
        }
    }
    
}
//MARK: UITableView Delegate
extension UserResumeViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0  ? UITableView.automaticDimension : 150
    }
}
