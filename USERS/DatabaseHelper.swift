//
//  DatabaseHelper.swift
//  USERS
//
//  Created by webwerks on 28/12/22.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper{
    
    static let shared = DatabaseHelper()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var userData = [RegisterList]()
    
    func save(_ data: UserModel){
        let context = self.appDelegate.persistentContainer.viewContext
        let register = NSEntityDescription.insertNewObject(forEntityName: "RegisterList", into: context) as! RegisterList
        let userRegisterData = data.register
        register.image = userRegisterData?.image
        register.firstName = userRegisterData?.firstName
        register.lastName = userRegisterData?.lastName
        register.phoneNo = userRegisterData?.phoneNo
        register.email = userRegisterData?.email
        register.gender = userRegisterData?.gender
        register.password = userRegisterData?.password
        register.confirmPassword = userRegisterData?.confirmPassword
        
        let userQualification = data.qualification
        register.designation = userQualification?.designation
        register.domain = userQualification?.domain
        register.education = userQualification?.education
        register.experiance = userQualification?.experiance
        register.grade = userQualification?.grade
        register.yearOfPassing = userQualification?.yearOfPassing
        
        let userAddress = data.address
        register.address = userAddress?.address
        register.landmark = userAddress?.landmark
        register.city = userAddress?.city
        register.state = userAddress?.state
        register.pincode = userAddress?.pincode
        do {
            try context.save()
        } catch let error {
            // print("save error", error.localizedDescription)
        }
    }
    func fetch() -> [RegisterList] {
        let context = self.appDelegate.persistentContainer.viewContext
        do {
            userData = try context.fetch(RegisterList.fetchRequest())
            //print("fetched userData ",userData.debugDescription)
        } catch {
           // print("couldnt fetch")
        }
        return userData
    }
    
}
