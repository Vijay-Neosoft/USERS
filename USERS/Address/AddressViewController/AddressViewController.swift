



import UIKit
import IQKeyboardManagerSwift
import DropDown

class AddressViewController: UIViewController {
    //MARK: Iboutlet
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var landMarkTextField: UITextField!
    @IBOutlet weak var dropDownForState: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var pincodeTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    //MARK: Global Variable Declaration
    var stateDropdown = DropDown()
    var registerData:RegisterData!
    var qualificationData:QualificationData!
    var addressDataModel:AddressData!
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Address"
    }
    //MARK: AddressData rendering Function
    func addressData(){
        let address = AddressData(address:addressTextField.text ?? "", city: cityTextField.text ?? "", landmark: landMarkTextField.text ?? "", pincode: pincodeTextField.text ?? "" , state: stateTextField.text ?? "")
        self.addressDataModel = address
    }
    
    //MARK: DropDown Action & Functions
    @IBAction func dropDownStateSelectionAction(_ sender: Any) {
        setupDropDown(dropDownForState, and: stateDropdown, with: stateTextField)
        stateDropdown.dataSource = DropDownDataSourc.stateList
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
    
    //MARK: SubmitButton Action & Validations
    @IBAction func submit(_ sender: Any) {
        guard let address = addressTextField.text, let landmark = landMarkTextField.text, let pincode = pincodeTextField.text, let state = stateTextField.text, let city = cityTextField.text  else {
            return
        }
        if address == "" {
            showError(error:addressValidate.address.rawValue)
            return
        }
        if landmark == "" {
            showError(error:addressValidate.landmark.rawValue)
            return
        }
        if pincode.isValidPincode == false {
            showError(error:addressValidate.pincode.rawValue)
            return
        }
        if state == "" {
            showError(error:addressValidate.state.rawValue)
            return
        }
        if city.isValidCity == false {
            showError(error:addressValidate.city.rawValue)
            return
        }
        self.addressData()
        let userData = UserModel(register:self.registerData,address: self.addressDataModel,qualification:self.qualificationData)
        DatabaseHelper.shared.save(userData)
        //self.navigationController!.popToRootViewController(animated: true)
        let gappdelegate = UIApplication.shared.delegate as! AppDelegate
        gappdelegate.setRootViewController()
    }
}

struct DropDownDataSourc {
    static let stateList = ["MP","RJ","WB","MH"]
}

//MARK: Address validation Strings
enum addressValidate:String{
    case address = "Please Provide Address"
    case landmark = "Please Provide Landmark"
    case state = "Invalid State"
    case pincode = "Invalid Pincode"
    case city = "Invalid City"
}


