


import UIKit
import IQKeyboardManagerSwift

class RegisterViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {
    
    //
    @IBOutlet weak var imageuser: UIImageView!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var phoneNumberTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var confirmpasswordLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var buttonmale: UIButton!
    
    @IBOutlet weak var buttonFemale: UIButton!
    
    @IBOutlet weak var genderLabel: UILabel!
    var registerData:RegisterData!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register"
        buttonmale.setImage(UIImage.init(named: "Unchekded"), for: .normal)
        buttonmale.setImage(UIImage.init(named: "checked"), for: .selected)
        buttonFemale.setImage(UIImage.init(named: "Unchekded"), for: .normal)
        buttonFemale.setImage(UIImage.init(named: "checked"), for: .selected)
        buttonmale.isSelected = true
        
        // Do any additional setup after loading the view.
    }
    func insertData(){
        self.registerData = RegisterData(firstName:self.firstNameTextfield.text ?? "", lastName: self.lastNameTextfield.text ?? "", phoneNo: self.phoneNumberTextfield.text ?? "", email:self.emailTextfield.text ?? "", password:self.passwordTextfield.text ?? "", confirmPassword: self.confirmPasswordTextfield.text ?? "", gender: self.buttonmale.isSelected ? "M" : "F", image: Data())
        //        userModelData = UserModel(register:registerData)
        //        DatabaseHelper.shareInstance.save(userModelData)
    }
    
    @IBAction func buttonSelectGender(_ sender: UIButton) {
        if sender == buttonmale{
            buttonmale.isSelected = true
            buttonFemale.isSelected = false
        }else{
            buttonmale.isSelected = false
            buttonFemale.isSelected = true
        }
    }
    
    @IBAction func chooseImageAction(_ sender: Any) {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self // new
        present(imagePickerVC, animated: true)
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            
            if let image = info[.originalImage] as? UIImage {
                imageuser.image = image
            }
        }
    }
    
    
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        self.insertData()
        
        
        guard let firstNameTextfield = firstNameTextfield.text, let lastNameTextfield = lastNameTextfield.text, let phoneNumberTextfield = phoneNumberTextfield.text, let email = emailTextfield.text, let password = passwordTextfield.text, let confirmPass = confirmPasswordTextfield.text   else {
            return
        }
//        if firstNameTextfield.isValidName {
//            print("name valid")
//        }
        if (firstNameTextfield == "" && password ==  "" && phoneNumberTextfield == "" && lastNameTextfield == "" ){
            let error = "Please Fill Alln The Details "
            print("Please Fill All The Details ")
            showError(error: error)
            
        }
        else if(firstNameTextfield == "" ){
            let error = "Please Enter First Name"
            print("Please Enter First Name")
            showError(error: error)
            
        }
        else if !(firstNameTextfield.validateName()) {
            let error = "First name's length must be more than 3 characters"
            print("Please Enter First Name")
            showError(error: error)
            
        }
        
        else if(lastNameTextfield == "" ){
            let error = "Please Enter Last Name "
            print("Please Enter Last Name")
            showError(error: error)
            
        }
        else if(email == "" && password ==  "" && phoneNumberTextfield == "" && lastNameTextfield == ""  ){
            let error = "Please Fill All the details "
            print("please fill all the details")
            showError(error: error)
            
        }
        
        else if !(lastNameTextfield.validateName()){
            let error = "Last name's length must be more than 3 characters"
            print("invalid last name")
            showError(error: error)
            
        }
        else if(email == "" ){
            let error = "Please Enter Email "
            print("Please Enter Email")
            showError(error: error)
        }
        else if(email == "" && password ==  "" && phoneNumberTextfield == "" && firstNameTextfield == "" ){
            let error = "please fill all details"
            print("please fill  all details")
            showError(error: error)
        }
        else if !(email.validateEmail()){
            let error = "Please Enter Valid email "
            print("mail invalid")
            showError(error: error)
            
        }
        else if(phoneNumberTextfield == "" ){
            let error = "Please Enter Phone Number"
            print("Please Enter Phone Number")
            showError(error: error)
            
        }else if !(phoneNumberTextfield.validatePhone()){
            let error = "Please Enter Valid phone No"
            print("phoneno Invalid")
            showError(error: error)
            
        }
        else if !(password.validatePassword()) {
            let error = "Please Enter Valid password"
            print("valid password")
            showError(error: error)
            
        }else if !(confirmPass == password){
            let error = "Please Enter confirm password doesn't match with password"
            print("confirm password doesn't match with password")
            showError(error: error)
            
        }
        
        
        
        
        guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "QualificationViewController") as? QualificationViewController
        else{
            return
        }
        vc.registerData = self.registerData
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
        
    }
    func showError(error : String){
        print("All fields mandtry!")
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}







