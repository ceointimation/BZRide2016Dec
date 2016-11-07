//
//  DriverRegViewController.swift
//  BZRide
//
//  Created by Sooraj on 9/23/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class DriverRegViewController: UIViewController,UITextFieldDelegate{
    
    var textId = 1
    
    @IBOutlet var ViewRegDetails : UIView!
    @IBOutlet var ViewVehicleDetails : UIView!
    @IBOutlet var ViewLiscenceDetails : UIView!
    @IBOutlet var ViewInsuranceDetails : UIView!
    @IBOutlet var datePickerView: UIView!
    @IBOutlet var agreementView: UIView!
    @IBOutlet var agreementScroll: UIScrollView!
    @IBOutlet var termAgreement: UITextView!
    @IBOutlet var declineTapped: UIButton!
    @IBOutlet var acceptTapped: UIButton!
    
    @IBOutlet var dateView: UIDatePicker!
    @IBOutlet var doneBtn: UIButton!
    @IBOutlet var dateCancel: UIButton!
    
    @IBOutlet var tbFstName: UITextField!
    @IBOutlet var tbMidName: UITextField!
    @IBOutlet var tbLastName: UITextField!
    @IBOutlet var tbemail: UITextField!
    @IBOutlet var tbPW: UITextField!
    @IBOutlet var tbPWConfrm: UITextField!
    @IBOutlet var tbAddress1: UITextField!
    @IBOutlet var tbAddress2: UITextField!
    @IBOutlet var tbPh: UITextField!
   // @IBOutlet var tbdob: UITextField!
    @IBOutlet var btnRegister: UIButton!
    @IBOutlet var tbcity: UITextField!
    @IBOutlet var tbstate: UITextField!
    @IBOutlet var tbzip: UITextField!
    //@IBOutlet var tbssn: UITextField!
    
    @IBOutlet var tbNumberPlateNumber: UITextField!
    @IBOutlet var tbRegistrationState: UITextField!
    @IBOutlet var tbDateofRegistrtation: UITextField!
    @IBOutlet var tbDateofexpiryVehicle: UITextField!
    @IBOutlet var tbYearofManufacture: UITextField!
    @IBOutlet var tbVehicleModel: UITextField!
    @IBOutlet var tbVehicleMake: UITextField!
    @IBOutlet var tbVehicleColor: UITextField!
    @IBOutlet var btnVehicle: UIButton!
    
    
    @IBOutlet var tbLiscenseNumber: UITextField!
    @IBOutlet var tbStateissued: UITextField!
    @IBOutlet var tbDateofIssue: UITextField!
    @IBOutlet var tbDateofexpiryLis: UITextField!
    @IBOutlet var btnLiscence: UIButton!
    
    @IBOutlet var tbInsuranceCompany: UITextField!
    @IBOutlet var tbInsuranceNumber: UITextField!
    @IBOutlet var tbDatefrom: UITextField!
    @IBOutlet var tbDateofexpiryInsu: UITextField!
    @IBOutlet var btnInsurance: UIButton!
    
    //@IBOutlet var btnRegisterDone: UIButton!
    @IBOutlet var btnVehicleDone: UIButton!
    @IBOutlet var btnLiscenceDone: UIButton!
    @IBOutlet var btnInsuranceDone: UIButton!
    @IBOutlet var btnSave: UIButton!
    
    @IBOutlet var ScrlViewDriverReg1: UIScrollView!
    
    @IBOutlet var scrlview: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //tbdob.delegate = self
        datePickerView.isHidden=true
        ScrlViewDriverReg1.contentSize.height=840
        agreementView.isHidden=true
        ShowRegistrationView(self)
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        let tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        
        self.ViewRegDetails.addGestureRecognizer(tapGesture1)
        
        self.ViewVehicleDetails.addGestureRecognizer(tapGesture2)
        self.ViewLiscenceDetails.addGestureRecognizer(tapGesture3)
        self.ViewInsuranceDetails.addGestureRecognizer(tapGesture4)
        self.datePickerView.addGestureRecognizer(tapGesture5)
        self.agreementView.addGestureRecognizer(tapGesture6)
    }
    
    func tapBlurButton(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        print("Please Help!")
    }
    
    // text field dob editing
    /*func textFieldDidBeginEditing(_ tbdob: UITextField) {
        ViewRegDetails.isHidden=true
        datePickerView.isHidden=false
        btnRegister.isHidden=true
        btnVehicle.isHidden=true
        btnLiscence.isHidden=true
        btnInsurance.isHidden=true
        btnSave.isHidden=true
        textId = 0
    }*/
    
    @IBAction func regDateView(_ sender: AnyObject) {
        ViewVehicleDetails.isHidden=true
        datePickerView.isHidden=false
        textId = 1
        
    }
    
    @IBAction func expiryDateView(_ sender: AnyObject) {
        ViewVehicleDetails.isHidden=true
        datePickerView.isHidden=false
        textId = 2
    }
    @IBAction func licIssDate(_ sender: AnyObject) {
        ViewLiscenceDetails.isHidden=true
        datePickerView.isHidden=false
        textId = 3
    }
    @IBAction func licExpDate(_ sender: AnyObject) {
        ViewLiscenceDetails.isHidden=true
        datePickerView.isHidden=false
        textId = 4
    }
    @IBAction func insuIssDate(_ sender: AnyObject) {
        ViewInsuranceDetails.isHidden=true
        datePickerView.isHidden=false
        textId = 5
    }
    @IBAction func insuExpDate(_ sender: AnyObject) {
        ViewInsuranceDetails.isHidden=true
        datePickerView.isHidden=false
        textId = 6
    }
    
    // Date picker done button
    @IBAction func doneTapped(_ sender: AnyObject) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let strDate = dateFormatter.string(from: dateView.date)
        if(textId == 0)
        {
           /* self.tbdob.text = strDate
            datePickerView.isHidden=true
            ViewRegDetails.isHidden=false
            btnRegister.isHidden=false
            btnVehicle.isHidden=false
            btnLiscence.isHidden=false
            btnInsurance.isHidden=false
            btnSave.isHidden=false*/
        }
        else if(textId == 1)
        {
            self.tbDateofRegistrtation.text = strDate
            datePickerView.isHidden=true
            ViewVehicleDetails.isHidden=false
        }
        else if(textId == 2)
        {
            self.tbDateofexpiryVehicle.text = strDate
            datePickerView.isHidden=true
            ViewVehicleDetails.isHidden=false
        }
        else if(textId == 3)
        {
            self.tbDateofIssue.text = strDate
            datePickerView.isHidden=true
            ViewLiscenceDetails.isHidden=false
        }
        else if(textId == 4)
        {
            self.tbDateofexpiryLis.text = strDate
            datePickerView.isHidden=true
            ViewLiscenceDetails.isHidden=false
        }
        else if(textId == 5)
        {
            self.tbDatefrom.text = strDate
            datePickerView.isHidden=true
            ViewInsuranceDetails.isHidden=false
        }
        else if(textId == 6)
        {
            self.tbDateofexpiryInsu.text = strDate
            datePickerView.isHidden=true
            ViewInsuranceDetails.isHidden=false
        }
     }

    // Date picker cancel button
    @IBAction func cancelTapped(_ sender: AnyObject) {
        if(textId == 0)
        {
            datePickerView.isHidden=true
            ViewRegDetails.isHidden=false
            btnRegister.isHidden=false
            btnVehicle.isHidden=false
            btnLiscence.isHidden=false
            btnInsurance.isHidden=false
            btnSave.isHidden=false
        }
        else if(textId == 1 || textId == 2)
        {
            datePickerView.isHidden=true
            ViewVehicleDetails.isHidden=false
        }
        else if(textId == 3 || textId == 4)
        {
            datePickerView.isHidden=true
            ViewLiscenceDetails.isHidden=false
        }
        else if(textId == 5 || textId == 6)
        {
            datePickerView.isHidden=true
            ViewInsuranceDetails.isHidden=false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func ShowRegistrationView(_ sender: AnyObject) {
        ViewRegDetails.isHidden=false
        ViewVehicleDetails.isHidden=true
        ViewLiscenceDetails.isHidden=true
        ViewInsuranceDetails.isHidden=true
        datePickerView.isHidden=true
        btnRegister.isHidden=false
        btnVehicle.isHidden=false
        btnLiscence.isHidden=false
        btnInsurance.isHidden=false
        btnSave.isHidden=false
        tbFstName.becomeFirstResponder()
    }
    
    @IBAction func ShowVehicleDetails(_ sender: AnyObject) {
        ViewRegDetails.isHidden=true
        ViewVehicleDetails.isHidden=false
        ViewLiscenceDetails.isHidden=true
        ViewInsuranceDetails.isHidden=true
        datePickerView.isHidden=true
        btnRegister.isHidden=true
        btnVehicle.isHidden=true
        btnLiscence.isHidden=true
        btnInsurance.isHidden=true
        btnSave.isHidden=true
        tbNumberPlateNumber.becomeFirstResponder()
        
}
    
    @IBAction func ShowLiscenseDetails(_ sender: AnyObject) {
        ViewRegDetails.isHidden=true
        ViewVehicleDetails.isHidden=true
        ViewLiscenceDetails.isHidden=false
        ViewInsuranceDetails.isHidden=true
        datePickerView.isHidden=true
        btnRegister.isHidden=true
        btnVehicle.isHidden=true
        btnLiscence.isHidden=true
        btnInsurance.isHidden=true
        btnSave.isHidden=true
        tbLiscenseNumber.becomeFirstResponder()
    }
    @IBAction func ShowInsuranceDetails(_ sender: AnyObject) {
        ViewRegDetails.isHidden=true
        ViewVehicleDetails.isHidden=true
        ViewLiscenceDetails.isHidden=true
        ViewInsuranceDetails.isHidden=false
        datePickerView.isHidden=true
        btnRegister.isHidden=true
        btnVehicle.isHidden=true
        btnLiscence.isHidden=true
        btnInsurance.isHidden=true
        btnSave.isHidden=true
        tbInsuranceCompany.becomeFirstResponder()
    }
    
    
   /* @IBAction func DoneRegistrationbtnClick(_ sender: AnyObject) {
        
        if tbFstName.text == "" || tbMidName.text == "" || tbLastName.text == ""  || tbemail.text == "" || tbPW.text == "" || tbPWConfrm.text == "" || tbAddress1.text == "" || tbAddress2.text == "" || tbcity.text == "" || tbstate.text == "" || tbzip.text == "" ||
            tbPh.text == "" || tbdob.text == "" {
            
            //Validation()
            
        }
        else{
            if tbPW.text != tbPWConfrm.text{
                
                let myAlert = UIAlertView()
                //myAlert.title = "Title"
                myAlert.message = "Password mismatch"
                myAlert.addButton(withTitle: "Ok")
                myAlert.delegate = self
                myAlert.show()
                
            }
            else{
                ShowVehicleDetails(self)
            }
        }
        
    }*/
    
    @IBAction func DoneVehicleDetailsbtnClick(_ sender: AnyObject) {

        if tbNumberPlateNumber.text == "" || tbRegistrationState.text == ""  || tbDateofRegistrtation.text == "" || tbDateofexpiryVehicle.text == ""  || 		tbYearofManufacture.text == "" || tbVehicleModel.text == ""  || tbVehicleMake.text == "" || tbVehicleColor.text == ""
            {
                tbNumberPlateNumber.becomeFirstResponder()
                displayAlert(messageToDisplay: "Please fill Vehicle Details")
            }
       else{
                ShowRegistrationView(self)
            tbFstName.becomeFirstResponder()
            }
    }
    
    @IBAction func DoneLiscenceDetailsbtnClick(_ sender: AnyObject) {
        
        if tbLiscenseNumber.text == "" || tbStateissued.text == ""  || tbDateofIssue.text == "" || tbDateofexpiryLis.text == ""  {
            
            tbLiscenseNumber.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please fill Liscense Details")
            
        }
        else{
            
           ShowRegistrationView(self)
            tbFstName.becomeFirstResponder()
            // ShowInsuranceDetails(self)
            
        }
        
    }
    
    @IBAction func DoneInsuranceDetailsbtnClick(_ sender: AnyObject) {
        
        if tbInsuranceCompany.text == "" || tbInsuranceNumber.text == ""  || tbDatefrom.text == "" || tbDateofexpiryInsu.text == ""  {
           tbInsuranceCompany.becomeFirstResponder()
           displayAlert(messageToDisplay: "Please fill Insurance Details")
            
        }
        else{
            tbFstName.becomeFirstResponder()
            ShowRegistrationView(self)
        }
        
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
    
    
    // Display Alert Message if any wrong data
   
    
    
    
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
    
    
    // validate password length
    func PwdLenth(password: String) -> Bool {
        if password.characters.count < 7{
            return false
        }
        else{
            return true
        }
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

    
    
    @IBAction func declineTappedAction(_ sender: AnyObject) {
        agreementView.isHidden=true
        ScrlViewDriverReg1.isHidden=false
        ShowRegistrationView(self)
    }
    
    @IBAction func acceptTappedAction(_ sender: AnyObject) {
       
        SVProgressHUD.show(withStatus: "Registering Driver")
        
        var request = URLRequest(url: URL(string: "http://bzride.com/bzride/RegisterDriver.php")!)
        request.httpMethod = "POST"
        
        let Registration="firstName="+tbFstName.text!+"&middleName="+tbMidName.text!+"&lastName="+tbLastName.text!+""
        let Registration1=Registration+"&email="+tbemail.text!+"&password="+tbPW.text!+"&address1="+tbAddress1.text!+""
        let Registration2=Registration1+"&address2="+tbAddress2.text!+"&city="+tbcity.text!+"&state="+tbstate.text!+"&zip="+tbzip.text!+"&phone="+tbPh.text!
        let Registration3=Registration2+"&currentlat=aa&currentlong=bb&deviceType=a&devicetoken=1&cardType=d&cardProvider=m&cardBillingAddress1=mattathil&cardBillingAddress2=chotani&cardBillingCity=kochi&cardBillingState=asd&cardBillingZip=9999&cardToken=12&BankName=sss&AccountToken=696"
        
         let vehInsu="&insCompany="+tbInsuranceCompany.text!+"&insPolicyNumber="+tbInsuranceNumber.text!+"&insValidFromDate="+tbDatefrom.text!+"&insExpDate="+tbDateofexpiryInsu.text!
        
        let vehLIC="&licenseNumber="+tbLiscenseNumber.text!+"&licenceStateIssued="+tbStateissued.text!+"&licenseDateIssued="+tbDateofIssue.text!+"&licenseExpDate="+tbDateofexpiryLis.text!
        
        let vehDetails1="&vNumber="+tbNumberPlateNumber.text!+"&vDateRegistered="+tbDateofRegistrtation.text!+"&vStateRegistered="+tbRegistrationState.text!
        let vehDetails2 = vehDetails1+"&vExpiryDate="+tbDateofexpiryVehicle.text!
        
        let vehDetails="&vModel="+tbVehicleModel.text!+"&vMake="+tbVehicleMake.text!+"&vColor="+tbVehicleColor.text!+"&vYear="+tbYearofManufacture.text!+"&deviceId=i"
        
        let postString=Registration3+vehInsu+vehLIC+vehDetails2+vehDetails
       
        
       // print("postString is ==============\(postString)")
        
        
        
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // checking http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
            
            let responseData = responseString?.data(using: .utf8)
            do{
                let dict:Dictionary<String,String>= try JSONSerialization.jsonObject(with: responseData!, options:[]) as!Dictionary	<String,String>
                let status = dict["status"]

               // let id = dict["Id"]
                
                if(status == "S")
                {
                    SVProgressHUD.dismiss()
                    let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDriveBankView") as! driverbankTableViewController
                    self.navigationController?.pushViewController(secondViewController, animated: true)
                    print("Successssss............")
                    
                }
                else{
                    SVProgressHUD.dismiss()
                     let myAlert = UIAlertView()
                     myAlert.message = "User with given phone already registered. Registration failed"
                     myAlert.addButton(withTitle: "Ok")
                     myAlert.delegate = self
                     myAlert.show()

                }
                
               // print("status response = \(status)")
                
            }
            catch let error as NSError{
            print("error = \(error)")
            }
            
        }
        task.resume()
}
    func displayAlert(messageToDisplay:String){
        let alertController = UIAlertController(title:"",message:messageToDisplay,preferredStyle:.alert)
        
        let OkAction = UIAlertAction(title:"OK", style:.default)
        alertController.addAction(OkAction)
        self.present(alertController,animated:true,completion:nil)
    }
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }

    @IBAction func SaveDriver(sender: AnyObject) {
        agreementView.isHidden=true
        var checkValue = 0
       if tbFstName.text == "" || tbMidName.text == "" || tbLastName.text == ""  || tbemail.text == "" || tbPW.text == "" || tbPWConfrm.text == "" || tbAddress1.text == "" || tbAddress2.text == "" || tbcity.text == "" || tbstate.text == "" || tbzip.text == "" || tbPh.text == ""
        {
            checkValue = 1
            tbFstName.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please fill Registrations Details")
            ShowRegistrationView(self)
        }
       else if tbNumberPlateNumber.text == "" || tbRegistrationState.text == ""  || tbDateofRegistrtation.text == "" || tbDateofexpiryVehicle.text == ""  || 		tbYearofManufacture.text == "" || tbVehicleModel.text == ""  || tbVehicleMake.text == "" || tbVehicleColor.text == ""
       {
        checkValue = 1
        tbNumberPlateNumber.becomeFirstResponder()
        displayAlert(messageToDisplay: "Please fill Vehicle Details")
        ShowVehicleDetails(self)
        }
        
       else if tbLiscenseNumber.text == "" || tbStateissued.text == ""  || tbDateofIssue.text == "" || tbDateofexpiryLis.text == ""  {
        checkValue = 1
        tbLiscenseNumber.becomeFirstResponder()
        displayAlert(messageToDisplay: "Please fill Liscense Details")
        ShowLiscenseDetails(self)
        
        }
        
        else if tbInsuranceCompany.text == "" || tbInsuranceNumber.text == ""  || tbDatefrom.text == "" || tbDateofexpiryInsu.text == ""  {
            checkValue = 1
            tbInsuranceCompany.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please fill Insurance Details")
            ShowInsuranceDetails(self)
            
        }
        else
       {
        
        let provideEmailAddress = tbemail.text
        let isEmailValid = isEmailAddress(emailAddressString:provideEmailAddress!)
        if isEmailValid != true {
            checkValue = 1
            tbemail.becomeFirstResponder()
            displayAlert(messageToDisplay: "Invalid Mail ID")
            ShowRegistrationView(self)
        }
        
        let providePwordchk = tbPW.text
        let provideConfirmPword = tbPWConfrm.text
        let isConfirmPwordValid = PasswordSame(password:providePwordchk!,confirmpassword:provideConfirmPword!)
        if isConfirmPwordValid != true{
            checkValue = 1
            tbPW.becomeFirstResponder()
            displayAlert(messageToDisplay: "Password Mismatch")
            ShowRegistrationView(self)
        }

        let provideMobile = tbPh.text
        let isMobValid = validateMobile(value:provideMobile!)
        if isMobValid != true{
            checkValue = 1
            tbPh.becomeFirstResponder()
            displayAlert(messageToDisplay: "Incorrect Mobile No")
            ShowRegistrationView(self)
        }
        
        let provideZip = tbzip.text
        let isZipValid = validateZip(value:provideZip!)
        if isZipValid != true{
            checkValue = 1
            tbzip.becomeFirstResponder()
            displayAlert(messageToDisplay: "Incorrect Zip Code")
            ShowRegistrationView(self)
            }
        
         else{
            
            if checkValue == 0
            {
            agreementView.isHidden=false
            ScrlViewDriverReg1.isHidden=true
            ViewRegDetails.isHidden=true
            ViewVehicleDetails.isHidden=true
            ViewLiscenceDetails.isHidden=true
            ViewInsuranceDetails.isHidden=true
            datePickerView.isHidden=true
            btnRegister.isHidden=true
            btnVehicle.isHidden=true
            btnLiscence.isHidden=true
            btnInsurance.isHidden=true
            btnSave.isHidden=true
            }
            else{
                ShowRegistrationView(self)
            }
           }
         
         }
    }
    
    }
    
    /*func Validation() {
        
        let myAlert = UIAlertView()
        //myAlert.title = "Title"
        myAlert.message = "Please Fill All Fields"
        myAlert.addButton(withTitle: "Ok")
        myAlert.delegate = self
        myAlert.show()
    }*/

//}K
