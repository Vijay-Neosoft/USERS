



import UIKit
import IQKeyboardManagerSwift
import DropDown

class AddressViewController: UIViewController {
    
    var stateDropdown = DropDown()
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var landMarkTextField: UITextField!
    
    @IBOutlet weak var dropDownForState: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var pincodeTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    var registerData:RegisterData!
    var qualificationData:QualificationData!
    var addressDataModel:AddressData!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Address"
        setupDropDown(dropDownForState, and: stateDropdown, with: stateTextField)
        stateDropdown.dataSource =
        ["MP","RJ","WB","MH"]
        
    }
    
    func addressData(){
        let dataAddress = AddressData(address:addressTextField.text ?? "", city: cityTextField.text ?? "", landmark: landMarkTextField.text ?? "", pincode: pincodeTextField.text ?? "" , state: stateTextField.text ?? "")
        self.addressDataModel = dataAddress
        
    }
    @IBAction func dropDownStateSelectionAction(_ sender: Any) {
        stateDropdown.show()
    }
    
    func setupDropDown(_ button: UIButton,and dropDown: DropDown,with textField: UITextField) {
        dropDown.anchorView = textField
        
        dropDown.bottomOffset = CGPoint(x: 0, y: button.bounds.height)
        
        dropDown.dismissMode = .onTap
        
        dropDown.selectionAction = { [weak self] (index, item) in
            guard let self = self else{ return }
            if item == "No Options"{ return }
            textField.text = item
            self.stateDropdown.hide()
            
        }
    }
    func showError(error : String){
        print("All fields mandtry!")
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func submit(_ sender: Any) {
        self.addressData()
        guard let address = addressTextField.text, let landmark = landMarkTextField.text, let pincode = pincodeTextField.text, let state = stateTextField.text, let city = cityTextField.text  else {
            return
        }
        if address == "" {
            print("Invalid Address")
            showError(error: "Please Provide Address")
        }
        if landmark == "" {
            print("Invalid LandMArk")
            showError(error: "please provide landmark ")
        }
        if pincode.isValidPincode == false {
            print("Invalid pincode")
            showError(error: "Invalid pincode")
        }
        if state == "" {
            print("Inavlid state")
            showError(error: "Please Provide Address")
        }
        if city.isValidCity == false {
            print("Invalid city")
            showError(error: "Invalid city")
        }
        
        let userData = UserModel(register:self.registerData,address: self.addressDataModel,qualification:self.qualificationData)
        DatabaseHelper.shared.save(userData)
        self.navigationController!.popToRootViewController(animated: true)
        
    }
}

extension String{
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

