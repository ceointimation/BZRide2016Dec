//
//  DriverRegisterTableViewController.swift
//  BZRide
//
//  Created by Kyeesha Technologies on 12/8/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class DriverRegisterTableViewController: UITableViewController {

    var myStringValue:Int?
   
    @IBOutlet weak var drFirstName: UITextField!
    @IBOutlet weak var drMiddleName: UITextField!
    @IBOutlet weak var drLastName: UITextField!
    @IBOutlet weak var drEmail: UITextField!
    @IBOutlet weak var drPassword: UITextField!
    @IBOutlet weak var drConfirmPassword: UITextField!
    @IBOutlet weak var drAddress1: UITextField!
    @IBOutlet weak var drAddress2: UITextField!
    @IBOutlet weak var drCity: UITextField!
    @IBOutlet weak var drState: UITextField!
    @IBOutlet weak var drZip: UITextField!
    @IBOutlet weak var drPhoneNo: UITextField!
    
    @IBOutlet weak var drVehicle: UIButton!
    @IBOutlet weak var drRegisterVehicle: UIButton!
    @IBOutlet weak var drInsurance: UIButton!
    @IBOutlet weak var drLicense: UIButton!
    @IBOutlet weak var drSaveRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor=UIColor.red
        
       let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DriverRegisterTableViewController.goBack))
        navigationItem.leftBarButtonItem = backButton
        
         let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
         self.tableView.addGestureRecognizer(tapGesture1)
        
      if(myStringValue == 2 || myStringValue == 3 || myStringValue == 4 || myStringValue == 5 )
      {
        
        let drfName = UserDefaults.standard
        let drfnameKeyValue = drfName.string(forKey: "drFnameKey")
        drFirstName.text = drfnameKeyValue
        
        let drMName = UserDefaults.standard
        let drMnameKeyValue = drMName.string(forKey: "drMnameKey")
        drMiddleName.text = drMnameKeyValue
        
        let drlName = UserDefaults.standard
        let drLnameKeyValue = drlName.string(forKey: "drLnameKey")
        drLastName.text = drLnameKeyValue
        
        let drEmailReg = UserDefaults.standard
        let drMailKeyValue = drEmailReg.string(forKey: "drEmailKey")
        drEmail.text = drMailKeyValue
        
        let drPassReg = UserDefaults.standard
        let drPassKeyValue = drPassReg.string(forKey: "drPassKey")
        drPassword.text = drPassKeyValue
        
        let drCpassReg = UserDefaults.standard
        let drCpassKeyValue = drCpassReg.string(forKey: "drCPassKey")
        drConfirmPassword.text = drCpassKeyValue
        
        let drAdder1Reg = UserDefaults.standard
        let drAdder1KeyValue = drAdder1Reg.string(forKey: "drAdder1Key")
        drAddress1.text = drAdder1KeyValue
        
        let drAdder2Reg = UserDefaults.standard
        let drAdder2KeyValue = drAdder2Reg.string(forKey: "drAdder2Key")
        drAddress2.text = drAdder2KeyValue
        
        let drCityRReg = UserDefaults.standard
        let drCityKeyValue = drCityRReg.string(forKey: "drCityRdKey")
        drCity.text = drCityKeyValue
        
        let drStateRReg = UserDefaults.standard
        let drStateKeyValue = drStateRReg.string(forKey: "drStateRdKey")
        drState.text = drStateKeyValue
        
        let drPhoneRReg = UserDefaults.standard
        let drPhoneKeyValue = drPhoneRReg.string(forKey: "drPhnKey")
        drPhoneNo.text = drPhoneKeyValue
        
        let drZipRReg = UserDefaults.standard
        let drZipKeyValue = drZipRReg.string(forKey: "drZipRdKey")
        drZip.text = drZipKeyValue
     }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func goBack(){
        dismiss(animated: true, completion: nil)
    }
    func tapBlurButton(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        //print("Please Help!")
    }
    
    func displayAlert(messageToDisplay:String){
        let alertController = UIAlertController(title:"",message:messageToDisplay,preferredStyle:.alert)
        
        let OkAction = UIAlertAction(title:"OK", style:.default)
        alertController.addAction(OkAction)
        self.present(alertController,animated:true,completion:nil)
    }
    
    // Email Validation function
    func isEmailAddress(emailAddressString: String) -> Bool{
        var returnvalue = true
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        do{
            let regex = try NSRegularExpression(pattern:emailRegEx)
            let nsString = emailAddressString as NSString
            let result = regex.matches(in:emailAddressString,range:NSRange(location:0,length:nsString.length))
            if result.count == 0
            {
                returnvalue = false
            }
        }catch let error as NSError{
            print("Invalid regex:\(error.localizedDescription)")
            returnvalue = false
        }
        return returnvalue
    }
    
    // validate mobile number
    func validateMobile(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    // validate zip code
    func validateZip(value: String) -> Bool {
        let ZIP_REGEX = "^\\d{6}$"
        let zipTest = NSPredicate(format: "SELF MATCHES %@", ZIP_REGEX)
        let result =  zipTest.evaluate(with: value)
        return result
    }
    
    // validate password mismatch
    func PasswordSame(password: String , confirmpassword : String) -> Bool {
        if password == confirmpassword{
            return true
        }
        else{
            return false
        }
    }

    @IBAction func vehicleButtonTapped(_ sender: AnyObject) {
        
        let drfName = UserDefaults.standard
        drfName.set(drFirstName.text!, forKey: "drFnameKey")
        
        let drMName = UserDefaults.standard
        drMName.set(drMiddleName.text!, forKey: "drMnameKey")
        
        let drLName = UserDefaults.standard
        drLName.set(drLastName.text!, forKey: "drLnameKey")
        
        let drEmailReg = UserDefaults.standard
        drEmailReg.set(drEmail.text!, forKey: "drEmailKey")
        
        let drPassReg = UserDefaults.standard
        drPassReg.set(drPassword.text!, forKey: "drPassKey")
        
        let drCpassReg = UserDefaults.standard
        drCpassReg.set(drConfirmPassword.text!, forKey: "drCPassKey")
        
        let drAdder1Reg = UserDefaults.standard
        drAdder1Reg.set(drAddress1.text!, forKey: "drAdder1Key")
        
        let drAdder2Reg = UserDefaults.standard
        drAdder2Reg.set(drAddress2.text!, forKey: "drAdder2Key")
        
        let drCityRReg = UserDefaults.standard
        drCityRReg.set(drCity.text!, forKey: "drCityRdKey")
        
        let drStateRReg = UserDefaults.standard
        drStateRReg.set(drState.text!, forKey: "drStateRdKey")
        
        let zipR = UserDefaults.standard
        zipR.set(drZip.text!, forKey: "drZipRdKey")
        
        let drPhoneRReg = UserDefaults.standard
        drPhoneRReg.set(drPhoneNo.text!, forKey: "drPhnKey")
        
        let vehicleRegiViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDriverVehicleTabView") as! DriverVehicleTableViewController
        vehicleRegiViewController.dataDispCheck1 = myStringValue
        self.navigationController?.pushViewController(vehicleRegiViewController, animated: true)
    }
    
    @IBAction func registerVehicleTapped(_ sender: AnyObject) {
        let drfName = UserDefaults.standard
        drfName.set(drFirstName.text!, forKey: "drFnameKey")
        
        let drMName = UserDefaults.standard
        drMName.set(drMiddleName.text!, forKey: "drMnameKey")
        
        let drLName = UserDefaults.standard
        drLName.set(drLastName.text!, forKey: "drLnameKey")
        
        let drEmailReg = UserDefaults.standard
        drEmailReg.set(drEmail.text!, forKey: "drEmailKey")
        
        let drPassReg = UserDefaults.standard
        drPassReg.set(drPassword.text!, forKey: "drPassKey")
        
        let drCpassReg = UserDefaults.standard
        drCpassReg.set(drConfirmPassword.text!, forKey: "drCPassKey")
        
        let drAdder1Reg = UserDefaults.standard
        drAdder1Reg.set(drAddress1.text!, forKey: "drAdder1Key")
        
        let drAdder2Reg = UserDefaults.standard
        drAdder2Reg.set(drAddress2.text!, forKey: "drAdder2Key")
        
        let drCityRReg = UserDefaults.standard
        drCityRReg.set(drCity.text!, forKey: "drCityRdKey")
        
        let drStateRReg = UserDefaults.standard
        drStateRReg.set(drState.text!, forKey: "drStateRdKey")
        
        let zipR = UserDefaults.standard
        zipR.set(drZip.text!, forKey: "drZipRdKey")
        
        let drPhoneRReg = UserDefaults.standard
        drPhoneRReg.set(drPhoneNo.text!, forKey: "drPhnKey")
        
        let vehicleRegiViewController = self.storyboard?.instantiateViewController(withIdentifier: "newVehicleRegisterTabView") as! VehicleRegistrationTableViewController
        vehicleRegiViewController.dataDispCheck2 = myStringValue
        self.navigationController?.pushViewController(vehicleRegiViewController, animated: true)
        
    }
    
    @IBAction func vehicleInsuranceTapped(_ sender: AnyObject) {
        let drfName = UserDefaults.standard
        drfName.set(drFirstName.text!, forKey: "drFnameKey")
        
        let drMName = UserDefaults.standard
        drMName.set(drMiddleName.text!, forKey: "drMnameKey")
        
        let drLName = UserDefaults.standard
        drLName.set(drLastName.text!, forKey: "drLnameKey")
        
        let drEmailReg = UserDefaults.standard
        drEmailReg.set(drEmail.text!, forKey: "drEmailKey")
        
        let drPassReg = UserDefaults.standard
        drPassReg.set(drPassword.text!, forKey: "drPassKey")
        
        let drCpassReg = UserDefaults.standard
        drCpassReg.set(drConfirmPassword.text!, forKey: "drCPassKey")
        
        let drAdder1Reg = UserDefaults.standard
        drAdder1Reg.set(drAddress1.text!, forKey: "drAdder1Key")
        
        let drAdder2Reg = UserDefaults.standard
        drAdder2Reg.set(drAddress2.text!, forKey: "drAdder2Key")
        
        let drCityRReg = UserDefaults.standard
        drCityRReg.set(drCity.text!, forKey: "drCityRdKey")
        
        let drStateRReg = UserDefaults.standard
        drStateRReg.set(drState.text!, forKey: "drStateRdKey")
        
        let zipR = UserDefaults.standard
        zipR.set(drZip.text!, forKey: "drZipRdKey")
        
        let drPhoneRReg = UserDefaults.standard
        drPhoneRReg.set(drPhoneNo.text!, forKey: "drPhnKey")
        
        let vehicleInsuViewController = self.storyboard?.instantiateViewController(withIdentifier: "newInsuranceRegisterTabView") as! InsuranceRegisterTableViewController
        vehicleInsuViewController.dataDispCheck3 = myStringValue
        self.navigationController?.pushViewController(vehicleInsuViewController, animated: true)
    }
    
    
    @IBAction func vehicleLiceTapped(_ sender: AnyObject) {
        let drfName = UserDefaults.standard
        drfName.set(drFirstName.text!, forKey: "drFnameKey")
        
        let drMName = UserDefaults.standard
        drMName.set(drMiddleName.text!, forKey: "drMnameKey")
        
        let drLName = UserDefaults.standard
        drLName.set(drLastName.text!, forKey: "drLnameKey")
        
        let drEmailReg = UserDefaults.standard
        drEmailReg.set(drEmail.text!, forKey: "drEmailKey")
        
        let drPassReg = UserDefaults.standard
        drPassReg.set(drPassword.text!, forKey: "drPassKey")
        
        let drCpassReg = UserDefaults.standard
        drCpassReg.set(drConfirmPassword.text!, forKey: "drCPassKey")
        
        let drAdder1Reg = UserDefaults.standard
        drAdder1Reg.set(drAddress1.text!, forKey: "drAdder1Key")
        
        let drAdder2Reg = UserDefaults.standard
        drAdder2Reg.set(drAddress2.text!, forKey: "drAdder2Key")
        
        let drCityRReg = UserDefaults.standard
        drCityRReg.set(drCity.text!, forKey: "drCityRdKey")
        
        let drStateRReg = UserDefaults.standard
        drStateRReg.set(drState.text!, forKey: "drStateRdKey")
        
        let zipR = UserDefaults.standard
        zipR.set(drZip.text!, forKey: "drZipRdKey")
        
        let drPhoneRReg = UserDefaults.standard
        drPhoneRReg.set(drPhoneNo.text!, forKey: "drPhnKey")
        
        let vehicleLiceViewController = self.storyboard?.instantiateViewController(withIdentifier: "newILicenseRegisterTabView") as! LicenseTableViewController
        vehicleLiceViewController.dataDispCheck4 = myStringValue
        self.navigationController?.pushViewController(vehicleLiceViewController, animated: true)
    }

    @IBAction func registerTapped(_ sender: AnyObject) {
        if(drFirstName.text == "")
        {
            drFirstName.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter First name")
        }
        else if(drMiddleName.text == "")
        {
            drMiddleName.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Middle name")
        }
        else if(drLastName.text == "")
        {
            drLastName.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Last name")
        }
        else if(drEmail.text == "")
        {
            drEmail.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Email")
        }
        else if(drPassword.text == "")
        {
            drPassword.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Password")
        }
        else if(drConfirmPassword.text == "")
        {
            drConfirmPassword.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Confirm password")
        }
        else if(drAddress1.text == "")
        {
            drAddress1.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Address1")
        }
        else if(drAddress2.text == "")
        {
            drAddress2.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Address2")
        }
        else if(drCity.text == "")
        {
            drCity.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter City")
        }
        else if(drState.text == "")
        {
            drState.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter State")
        }
        else if(drZip.text == "")
        {
            drZip.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Zip")
        }
        else if(drPhoneNo.text == "")
        {
            drPhoneNo.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Phone number")
        }
        else
        {
            let provideEmailAddress = drEmail.text
            let isEmailValid = isEmailAddress(emailAddressString:provideEmailAddress!)
            if isEmailValid != true {
                drEmail.becomeFirstResponder()
                displayAlert(messageToDisplay: "Invalid Mail ID")
            }
            
            let providePwordchk = drPassword.text
            let provideConfirmPword = drConfirmPassword.text
            let isConfirmPwordValid = PasswordSame(password:providePwordchk!,confirmpassword:provideConfirmPword!)
            if isConfirmPwordValid != true{
                drPassword.becomeFirstResponder()
                displayAlert(messageToDisplay: "Password Mismatch")
            }
            
            let provideZip = drZip.text
            let isZipValid = validateZip(value:provideZip!)
            if isZipValid != true{
                drZip.becomeFirstResponder()
                displayAlert(messageToDisplay: "Incorrect Zip Code")
            }
            
            let provideMobile = drPhoneNo.text
            let isMobValid = validateMobile(value:provideMobile!)
            if isMobValid != true{
                drPhoneNo.becomeFirstResponder()
                displayAlert(messageToDisplay: "Incorrect Mobile No")
            }
            else{
                let agreementViewController = self.storyboard?.instantiateViewController(withIdentifier: "newConditionsAndTerms") as! conditiondsAndTermsViewController
                self.navigationController?.pushViewController(agreementViewController, animated: true)
            }
        }
    }
}
