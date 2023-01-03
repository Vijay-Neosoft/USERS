import Foundation
import UIKit

extension String{
    
  
 
    func validateName() -> Bool {
        let nameRegex =  "[a-zA-Z]{3,18}$"
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let isValidateName = validateName.evaluate(with: trimmedString)
        return isValidateName
    }
    func validatePhone() -> Bool{
        let phoneRegex = "^[0-9]{10}$"
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let isValidatePhone = validateName.evaluate(with: trimmedString)
        return isValidatePhone
    }
    
    func validateEmail() -> Bool {
        let mailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", mailRegex)
        let isValidatemail = validateName.evaluate(with: trimmedString)
        return isValidatemail
    }
    
    func validatePassword() -> Bool {
        let passRegex = "[a-zA-Z0-9.@*^:;%£#<>{}&$()!]{8,}"
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", passRegex)
        let isValidpass = validateName.evaluate(with: trimmedString)
        return isValidpass
    }
    var isGradeValid:Bool{
        let gradeRegEx="[A-Za-z]{2,2}"
        let gradeTest = NSPredicate(format: "SELF MATCHES %@", gradeRegEx)
        return gradeTest.evaluate(with: self)
    }
    var isExperianceValid:Bool {
        let experianceRegEx="^[0-9]{2,2}$"
        let experianceTest = NSPredicate(format: "SELF MATCHES %@", experianceRegEx)
        return experianceTest.evaluate(with: self)
    }
    var isValidCity:Bool{
        let citytRegEx="[A-Za-z]{3,}"
        let cityTest = NSPredicate(format: "SELF MATCHES %@", citytRegEx)
        return cityTest.evaluate(with: self)
    }
    var isValidPincode:Bool {
        let pincodeRegEx="^[0-9]{6}$"
        let pincodeTest = NSPredicate(format: "SELF MATCHES %@", pincodeRegEx)
        return pincodeTest.evaluate(with: self)
    }
   
}


