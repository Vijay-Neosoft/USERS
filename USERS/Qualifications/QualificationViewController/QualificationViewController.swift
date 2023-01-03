
import UIKit
import IQKeyboardManagerSwift
import DropDown

class QualificationViewController: UIViewController {
    var dropdown = DropDown()
    //MARK: Iboutlet
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var domainTextField: UITextField!
    @IBOutlet weak var designationTextField: UITextField!
    @IBOutlet weak var gradeTextfield: UITextField!{
        didSet{
            gradeTextfield.delegate = self
        }
    }
    @IBOutlet weak var yearOfPassingTextfield: UITextField!
    @IBOutlet weak var educationTextField: UITextField!
    @IBOutlet weak var yearofexperianceTextField: UITextField!{
        didSet{
            yearOfPassingTextfield.delegate = self
        }
    }
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var dropDownButtonDomain: UIButton!
    @IBOutlet weak var dropDownButtonDesignation: UIButton!
    @IBOutlet weak var dropDownButtonYearOfPassing: UIButton!
    var dataqualification:QualificationData?
    var registerData:RegisterData?
    
    //MARK: View Life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ConstStringQualificationOfUser.navTitle.rawValue    }
    
    //MARK:qualification data
    func qualificationData(){
        self.dataqualification = QualificationData(designation:designationTextField.text ?? "",
                                                   domain: domainTextField.text ?? "",
                                                   education: educationTextField.text ?? "",
                                                   experiance:yearofexperianceTextField.text ?? "",
                                                   grade: gradeTextfield.text ?? "",
                                                   yearOfPassing: yearOfPassingTextfield.text ?? "" )
    }
    //Mark: SetupDropDown Function
    func setupDropDown(_ button: UIButton,and dropDown: DropDown,with textField: UITextField) {
        dropDown.anchorView = textField
        dropDown.bottomOffset = CGPoint(x: 0, y: button.bounds.height)
        dropDown.dismissMode = .onTap
        dropDown.selectionAction = { [weak self] (index, item) in
            guard let self = self else{ return }
            if item == "No Options"{ return }
            textField.text = item
            self.dropdown.hide()
            
        }
    }
    
    //MARK:DropDown Functions
    @IBAction func educationDropDownButton(_ sender: Any) {
        setupDropDown(dropDownButton, and: dropdown ,with:educationTextField)
        dropdown.dataSource = DropDownDataSource.educationList
        dropdown.show()
    }
    @IBAction func domainDropDown(_ sender: Any) {
        setupDropDown(dropDownButtonDomain, and: dropdown, with: domainTextField)
        dropdown.dataSource =  DropDownDataSource.domainList
        dropdown.show()
    }
    @IBAction func designationDropDown(_ sender: Any) {
        setupDropDown(dropDownButtonDesignation, and: dropdown, with: designationTextField)
        dropdown.dataSource =  DropDownDataSource.designationList
        dropdown.show()
    }
    @IBAction func yearOfPassingDropDown(_ sender: Any) {
        setupDropDown(dropDownButtonYearOfPassing, and: dropdown, with: yearOfPassingTextfield)
        dropdown.dataSource = DropDownDataSource.passingYearList
        dropdown.show()
    }
    
    
    //MARK: NextButton Action & Validations
    @IBAction func nextToAddress(_ sender: Any) {
        self.qualificationData()
        guard let eudcation = educationTextField.text, let yearofPassing = yearOfPassingTextfield.text, let grade = gradeTextfield.text, let experiance = yearofexperianceTextField.text, let domain = domainTextField.text,let desgination = designationTextField.text  else {
            return
        }
        
        if eudcation == "" {
            showError(error: qualificationValidate.education.rawValue)
            return
        }
        if yearofPassing == "" {
            showError(error: qualificationValidate.yearofPassing.rawValue)
            return
        }
        if grade.isGradeValid{
            showError(error: qualificationValidate.grade.rawValue)
            return
        }
        if desgination == "" {
            showError(error: qualificationValidate.designation.rawValue)
            return
        }
        if experiance == "" {
            showError(error: qualificationValidate.experiance.rawValue)
            return
        }
        if experiance.isExperianceValid {
            showError(error: qualificationValidate.experiance.rawValue)
            return
        }
        if domain == "" {
            showError(error:qualificationValidate.domain.rawValue)
            return
        }
        
        let vc = UIStoryboard.init(name:ConstStringQualificationOfUser.storyBoardName.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: ConstStringQualificationOfUser.navRegisterVC.rawValue) as? AddressViewController
        vc?.registerData = self.registerData
        vc?.qualificationData = self.dataqualification
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    //MARK: PreviousButton Action
    @IBAction func previousToRegister(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}
//MARK: UITextFieldDelegate
extension QualificationViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == gradeTextfield{
            return range.location <= 2
        }
        if textField == yearofexperianceTextField{
            return range.location <= 2
        }
        return true
    }
}

//MARK:- Enum for qualification validation string
enum qualificationValidate:String{
    case education = "Please Provide education Info"
    case yearofPassing = "Please Provide Year of Passing"
    case grade = "Invalid Grade"
    case experiance = "Please Provide experiance"
    case designation = "please provide designation Info"
    case domain = "Please Provide domain"
}
//MARK:- DropDownDataSource
struct DropDownDataSource {
    static let educationList = ["Post Graduate", "Graduate", "HSC/Diploma", "SSC"]
    static let passingYearList = ["2021","2020","2019","2018"]
    static let designationList = ["Trainee ","Software Deveopler"]
    static let domainList = ["Mobile","Testing","Design"]
}
//MARK:- Const String For Navigation
fileprivate enum ConstStringQualificationOfUser: String {
    case storyBoardName = "Main"
    case navRegisterVC = "AddressViewController"
    case navTitle = "Qualification"
}
