//
//  registerdata.swift
//  USERS
//
//  Created by webwerks on 26/12/22.
//

import Foundation
struct UserModel{
    var register:RegisterData?
    var address:AddressData?
    var qualification:QualificationData?
}

struct RegisterData {
    
    var firstName: String =  ""
    var lastName: String = ""
    var phoneNo: String = ""
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var gender: String = ""
    var image: Data = Data()
    
    init(firstName: String, lastName: String, phoneNo: String, email: String, password: String, confirmPassword: String, gender: String,image:Data) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNo = phoneNo
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.gender = gender
        self.image = image
    }
    
}
struct QualificationData{
    var designation: String = ""
    var domain: String = ""
    var education: String = ""
    var experiance: String = ""
    var grade: String = ""
    var yearOfPassing: String = ""
    
    init(designation: String, domain: String, education: String, experiance: String, grade: String, yearOfPassing: String) {
        self.designation = designation
        self.domain = domain
        self.education = education
        self.experiance = experiance
        self.grade = grade
        self.yearOfPassing = yearOfPassing
    }
    
}
struct AddressData {
    var address: String = ""
    var city: String = ""
    var landmark: String = ""
    var pincode: String = ""
    var state: String = ""
    
    init(address: String, city: String, landmark: String, pincode: String, state: String) {
        self.address = address
        self.city = city
        self.landmark = landmark
        self.pincode = pincode
        self.state = state
    }
}
