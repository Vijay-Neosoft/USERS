




import UIKit
import IQKeyboardManagerSwift
import DropDown


class QualificationViewController: UIViewController {
    
    var dropdown = DropDown()
    var dropdown1 = DropDown()
    var dropdown2 = DropDown()
    var dropdown3 = DropDown()
    
    @IBOutlet weak var educationInfoLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var educationQualificationlabel: UILabel!
    @IBOutlet weak var ProffessionalInfoLabel: UILabel!
    @IBOutlet weak var domainTextField: UITextField!
    @IBOutlet weak var designationTextField: UITextField!
    @IBOutlet weak var gradeTextfield: UITextField!
    @IBOutlet weak var yearOfPassingTextfield: UITextField!
    @IBOutlet weak var educationTextField: UITextField!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var domainLabel: UILabel!
    @IBOutlet weak var yearofexperianceTextField: UITextField!
    @IBOutlet weak var experianceLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var yearOfPassinglabel: UILabel!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var dropDownButtonDomain: UIButton!
    @IBOutlet weak var dropDownButtonDesignation: UIButton!
    @IBOutlet weak var dropDownButtonYearOfPassing: UIButton!
    var dataqualification:QualificationData!
    var registerData:RegisterData!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Qualification"
        setupDropDown(dropDownButton, and: dropdown ,with:educationTextField)
        dropdown.dataSource = ["Post Graduate", "Graduate", "HSC/Diploma", "SSC"]
        setupDropDown(dropDownButtonYearOfPassing, and: dropdown1, with: yearOfPassingTextfield)
        dropdown1.dataSource = ["2021","2020","2019","2018"]
        setupDropDown(dropDownButtonDesignation, and: dropdown2, with: designationTextField)
        dropdown2.dataSource = ["Trainee ","Software Deveopler"]
        setupDropDown(dropDownButtonDomain, and: dropdown3, with: domainTextField)
        dropdown3.dataSource = ["Mobile","Testing","Design"]
    }
    
    func qualificationData(){
        self.dataqualification = QualificationData(designation:designationTextField.text ?? "", domain: domainTextField.text ?? "", education: educationTextField.text ?? "", experiance:yearOfPassingTextfield.text ?? "", grade: gradeTextfield.text ?? "", yearOfPassing: yearOfPassingTextfield.text ?? "" )
    }
    
    @IBAction func educationDropDownButton(_ sender: Any) {
        dropdown.show()
    }
    @IBAction func domainDropDown(_ sender: Any) {
        dropdown3.show()
    }
    @IBAction func designationDropDown(_ sender: Any) {
        dropdown2.show()
    }
    @IBAction func yearOfPassingDropDown(_ sender: Any) {
        dropdown1.show()
    }
    
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
    
    func showError(error : String){
        print("All fields mandtry!")
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func nextToAddress(_ sender: Any) {
        self.qualificationData()
        
        guard let eudcation = educationTextField.text, let yearofPassing = yearOfPassingTextfield.text, let grade = gradeTextfield.text, let experiance = yearofexperianceTextField.text, let domain = domainTextField.text,let desgination = designationTextField.text  else {
            return
        }
        
        if eudcation == "" {
            print("please provide eudcation info ")
            showError(error: "Please Provide education info ")
        }
        if yearofPassing == "" {
            print("Please Provide Address")
            showError(error: "Please Provide Address")
        }
        if grade.isGradeValid{
            print("Invalid Grade")
            showError(error: "Invalid Grade")
        }
        if desgination == "" {
            print("please provide designation Info ")
            showError(error: "please provide designation Info ")
        }
        if experiance == "" {
            print(" Please Provide valid experiance")
            showError(error: "Please Provide valid experiance")
        }
        if domain == "" {
            print(" Please Provide domain")
            showError(error: "Please Provide domain")
        }
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddressViewController") as? AddressViewController
        vc?.registerData = self.registerData
        vc?.qualificationData = self.dataqualification
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func previousToRegister(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}
extension String{
    var isGradeValid:Bool{
        let gradeRegEx="[A-Za-z]{2,2}"
        let gradeTest = NSPredicate(format: "SELF MATCHES %@", gradeRegEx)
        return gradeTest.evaluate(with: self)
    }
    var isExperianceValid:Bool {
        let experianceRegEx="^[0-9]{1}$"
        let experianceTest = NSPredicate(format: "SELF MATCHES %@", experianceRegEx)
        return experianceTest.evaluate(with: self)
    }
}

