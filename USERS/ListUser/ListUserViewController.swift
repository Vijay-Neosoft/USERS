//
//  ViewController.swift
//  USERS
//
//  Created by webwerks on 22/12/22.
//

import UIKit

class ListUserViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var tableUSer: UITableView!
    var registerData:[RegisterList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableUSer.dataSource = self
        self.tableUSer.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerData = DatabaseHelper.shared.fetch()
        self.tableUSer.reloadData()
    }
    
    @IBAction func nextToUserResume(_ sender: UIButton) {
        guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserResumeViewController") as? UserResumeViewController
        else{
            return
        }
        self.present(vc, animated: true)
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        else{
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



extension ListUserViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registerData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserListTableViewCell
        let item = registerData[indexPath.row]
        cell.setData(item: item)
        //        cell.userAddress.text = item.city
        //        cell.userName.text = item.firstName
        //        cell.userImage.image = .add
        return cell
    }
    private func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = registerData[indexPath.row]
        guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserResumeViewController") as? UserResumeViewController
        else{
            return
        }
        vc.userData = registerData[indexPath.row]
        
        self.present(vc, animated: true)
    }
    
}

