//
//  ViewController.swift
//  USERS
//
//  Created by webwerks on 22/12/22.
//

import UIKit

class ListUserViewController: UIViewController {
    //MARK: Iboutlet
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var tableUSer: UITableView?
    
    //MARK: Global Variable Declaration
    fileprivate var registerData:[RegisterList]?
    
    //MARK: View Life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
    }
    
    //MARK: Ibaction Click Event
    @IBAction func registerAction(_ sender: UIButton) {
        guard let vc = UIStoryboard.init(name: ConstantStringListUser.storyBoardName.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: ConstantStringListUser.navRegisterVC.rawValue) as? RegisterViewController else{ return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ListUserViewController {
    //MARK: Tableview Setup and fetch data from DB
    fileprivate func setupTableview() {
        self.tableUSer?.dataSource = self
        self.tableUSer?.delegate = self
        self.title = ConstantStringListUser.navTitle.rawValue
        registerData = DatabaseHelper.shared.fetch()
        self.tableUSer?.reloadData()
    }
}

//MARK: Tableview Datasource Delegate
extension ListUserViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registerData?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantStringListUser.cellIdentifier.rawValue, for: indexPath) as! UserListTableViewCell
        if let dataRegister = registerData {
            let item = dataRegister[indexPath.row]
            cell.setData(item: item)
        }
        return cell
    }
}

//MARK: Tableview Delegate Method
extension ListUserViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = UIStoryboard.init(name: ConstantStringListUser.storyBoardName.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: ConstantStringListUser.navResumeVC.rawValue) as? UserResumeViewController else{ return }
        if let dataRegister = registerData {
            vc.userData = dataRegister[indexPath.row]
        }
        self.present(vc, animated: true)
    }
}

//MARK: String Constant Enum
fileprivate enum ConstantStringListUser: String {
    case storyBoardName = "Main"
    case navRegisterVC = "RegisterViewController"
    case navTitle = "Users"
    case cellIdentifier = "cell"
    case navResumeVC = "UserResumeViewController"
}

