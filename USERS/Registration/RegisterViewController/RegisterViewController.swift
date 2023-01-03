


import UIKit
import IQKeyboardManagerSwift

class RegisterViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {
    @IBOutlet weak var imageuser: UIImageView!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var phoneNumberTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var buttonmale: UIButton!
    @IBOutlet weak var buttonFemale: UIButton!
    @IBOutlet weak var passwordHideShow: UIButton!
    @IBOutlet weak var confirmPasswordHideShow: UIButton!
    //MARK: Global Variables
    var registerData:RegisterData?
    var imgData : Data?
    var showPassword = true
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ConstStringRegister.navTitle.rawValue
        genderTapped(isMale: true)
        imageuser.layer.cornerRadius = 45
    }
    @IBAction func actionOnConfirmPassword(_ sender: Any) {
        showPassword.toggle()
        confirmPasswordTextfield.isSecureTextEntry = !showPassword
    }
    
    @IBAction func ActiontOnPassword(_ sender: Any) {
        showPassword.toggle()
        passwordTextfield.isSecureTextEntry = !showPassword
    }
    
    
    //MARK: GenderSelection Button
    @IBAction func buttonSelectGender(_ sender: UIButton) {
        if sender == buttonmale{
            genderTapped(isMale: true)
        }else{
            genderTapped(isMale: false)
        }
    }
    
    //MARK: ImageAction
    @IBAction func chooseImageAction(_ sender: Any) {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self // new
        present(imagePickerVC, animated: true)
    }
    //MARK: Next Button Action
    @IBAction func nextButton(_ sender: Any) {
        if validate() {
            self.insertData()
            guard let vc = UIStoryboard.init(name: ConstStringRegister.storyBoardName.rawValue,
                                             bundle:Bundle.main).instantiateViewController(withIdentifier:ConstStringRegister.navRegisterVC.rawValue) as? QualificationViewController else { return }
            vc.registerData = self.registerData
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK: insertData function
    func insertData(){
        self.registerData = RegisterData(firstName:self.firstNameTextfield.text ?? "",
                                         lastName: self.lastNameTextfield.text ?? "",
                                         phoneNo: self.phoneNumberTextfield.text ?? "",
                                         email:self.emailTextfield.text ?? "",
                                         password:self.passwordTextfield.text ?? "",
                                         confirmPassword: self.confirmPasswordTextfield.text ?? "",
                                         gender: self.buttonmale.isSelected ? "M" : "F",
                                         image: imgData )
    }
    
    //MARK: imagePickerController function
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageuser.image = image
            imgData = image.pngData() ?? Data()
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

//MARK: Validation extension of RegisterViewController
extension RegisterViewController {
    fileprivate func validate() -> Bool {
        guard let firstNameTextfield = firstNameTextfield.text, let lastNameTextfield = lastNameTextfield.text, let phoneNumberTextfield = phoneNumberTextfield.text, let email = emailTextfield.text, let password = passwordTextfield.text, let confirmPass = confirmPasswordTextfield.text   else {
            return false
        }
        
        if(firstNameTextfield == "" ){
            let error = RegisterValidate.firstName.rawValue
            showError(error: error)
            return false
            
        }
        else if !(firstNameTextfield.validateName()) {
            let error = RegisterValidate.validateFirstName.rawValue
            showError(error: error)
            return false
        }
        
        else if(lastNameTextfield == "" ){
            let error = RegisterValidate.lastName.rawValue
            showError(error: error)
            return false
            
        }
        
        else if !(lastNameTextfield.validateName()){
            let error = RegisterValidate.validateLastName.rawValue
            showError(error: error)
            return false
        }
        else if(email == "" ){
            let error = RegisterValidate.email.rawValue
            showError(error: error)
            return false
        }
        
        else if !(email.validateEmail()){
            let error = RegisterValidate.validateEmail.rawValue
            showError(error: error)
            return false
        }
        else if(password == "" ){
            let error = RegisterValidate.password.rawValue
            showError(error: error)
            return false
        }
        
        else if !(phoneNumberTextfield.validatePhone()){
            let error = RegisterValidate.validatePhoneNO.rawValue
            showError(error: error)
            return false
            
        }
        else if !(password.validatePassword()) {
            let error = RegisterValidate.validatePassword.rawValue
            showError(error: error)
            return false
            
        }else if !(confirmPass == password){
            let error = RegisterValidate.confirmPassword.rawValue
            showError(error: error)
            return false
            
        }
        return true
    }
}
//MARK: GenderSelection Function
extension RegisterViewController {
    fileprivate func genderTapped(isMale:Bool) {
        if isMale {
            self.buttonmale.setImage(UIImage(named: "checked"), for: .normal)
            self.buttonFemale.setImage(UIImage(named: "Unchekded"), for: .normal)
        }else {
            self.buttonmale.setImage(UIImage(named: "Unchekded"), for: .normal)
            self.buttonFemale.setImage(UIImage(named: "checked"), for: .normal)
        }
    }
}
//MARK: RegsiterValidate Enum
enum RegisterValidate: String {
    case firstName = "Please enter first name"
    case lastName = "Please enter last name"
    case validateFirstName = "First name's length must be more than 3 characters"
    case validateLastName = "Last name's length must be more than 3 characters"
    case email  = "Please Enter Email"
    case validateEmail = "invalid email "
    case validatePhoneNO = "Inavlid Phone Number"
    case password = "Please Enter password "
    case validatePassword = "Invalid Password"
    case confirmPassword = "confirm password doesn't match with password "
}

//MARK enum ConstStrings Of Navigation
fileprivate enum ConstStringRegister: String {
    case storyBoardName = "Main"
    case navRegisterVC = "QualificationViewController"
    case navTitle = "Register"
}














