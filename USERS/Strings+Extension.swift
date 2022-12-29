import Foundation

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
        let mailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
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
    
    
}


