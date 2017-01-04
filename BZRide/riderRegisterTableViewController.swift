//
//  riderRegisterTableViewController.swift
//  BZRide
//
//  Created by Sooraj on 11/16/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class riderRegisterTableViewController: UITableViewController {

    
    var myStringValue:Int?
    var success:Int = 1
    
    @IBOutlet var rdFirstName: UITextField!
    @IBOutlet var rdMiddleName: UITextField!
    @IBOutlet var rdLastName: UITextField!
    @IBOutlet var rdEmail: UITextField!
    @IBOutlet var rdPassword: UITextField!
    @IBOutlet var rdConfirmPassword: UITextField!
    @IBOutlet var rdAddress1: UITextField!
    @IBOutlet var rdAddress2: UITextField!
    @IBOutlet var rdCity: UITextField!
    @IBOutlet var rdState: UITextField!
    @IBOutlet var rdZip: UITextField!
    @IBOutlet var rdPhoneNumber: UITextField!
    
    @IBOutlet var cardDetailsBtn: UIButton!
    @IBOutlet var riderRegister: UIButton!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.tableView.backgroundColor=UIColor.red
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(riderRegisterTableViewController.goBack))
        navigationItem.leftBarButtonItem = backButton
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        self.tableView.addGestureRecognizer(tapGesture1)
        
        print("myStringValue = \(myStringValue)")
        
        if (myStringValue == 2)
        {
            
        let checkFlag = UserDefaults.standard
        checkFlag.set("2", forKey: "checkFlagKey")
        
        let fName = UserDefaults.standard
        let fnameKeyValue = fName.string(forKey: "fnameKey")
        rdFirstName.text = fnameKeyValue
            
        let mName = UserDefaults.standard
        let mnameKeyValue = mName.string(forKey: "mnameKey")
        rdMiddleName.text = mnameKeyValue
        
        let lName = UserDefaults.standard
        let lnameKeyValue = lName.string(forKey: "lnameKey")
        rdLastName.text = lnameKeyValue
            
        let emailReg = UserDefaults.standard
        let mailKey = emailReg.string(forKey: "emailKey")
        rdEmail.text = mailKey
            
        let passReg = UserDefaults.standard
        let passKeyValue = passReg.string(forKey: "passKey")
        rdPassword.text = passKeyValue
            
        let cpassReg = UserDefaults.standard
        let cpassKeyValue = cpassReg.string(forKey: "cPassKey")
        rdConfirmPassword.text = cpassKeyValue
            
        let adder1Reg = UserDefaults.standard
        let adder1KeyValue = adder1Reg.string(forKey: "adder1Key")
        rdAddress1.text = adder1KeyValue
           
        let adder2Reg = UserDefaults.standard
        let adder2KeyValue = adder2Reg.string(forKey: "adder2Key")
        rdAddress2.text = adder2KeyValue
            
        let cityRReg = UserDefaults.standard
        let cityKeyValue = cityRReg.string(forKey: "cityRdKey")
        rdCity.text = cityKeyValue
            
        let stateRReg = UserDefaults.standard
        let stateKeyValue = stateRReg.string(forKey: "stateRdKey")
        rdState.text = stateKeyValue
            
        let phoneRReg = UserDefaults.standard
        let phoneKeyValue = phoneRReg.string(forKey: "phnKey")
        rdPhoneNumber.text = phoneKeyValue
            
        let zipRReg = UserDefaults.standard
        let zipKeyValue = zipRReg.string(forKey: "zipRdKey")
        rdZip.text = zipKeyValue
            
        }
        
        
    }
    func tapBlurButton(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        //print("Please Help!")
    }
    func goBack(){
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cardTap(_ sender: AnyObject) {
        
        let fName = UserDefaults.standard
        fName.set(rdFirstName.text!, forKey: "fnameKey")
        
        let mName = UserDefaults.standard
        mName.set(rdMiddleName.text!, forKey: "mnameKey")
        
        let lName = UserDefaults.standard
        lName.set(rdLastName.text!, forKey: "lnameKey")
        
        let defaults = UserDefaults.standard
        defaults.set(rdEmail.text!, forKey: "emailKey")
       
        let pass = UserDefaults.standard
        pass.set(rdPassword.text!, forKey: "passKey")
        
        let cPass = UserDefaults.standard
        cPass.set(rdConfirmPassword.text!, forKey: "cPassKey")
        
        let adder1 = UserDefaults.standard
        adder1.set(rdAddress1.text!, forKey: "adder1Key")
        
        let adder2 = UserDefaults.standard
        adder2.set(rdAddress2.text!, forKey: "adder2Key")
        
        let cityR = UserDefaults.standard
        cityR.set(rdCity.text!, forKey: "cityRdKey")
        
        let stateR = UserDefaults.standard
        stateR.set(rdState.text!, forKey: "stateRdKey")
        
        let zipR = UserDefaults.standard
        zipR.set(rdZip.text!, forKey: "zipRdKey")
        
        let phoneR = UserDefaults.standard
        phoneR.set(rdPhoneNumber.text!, forKey: "phnKey")
        
      /*  let riderCardViewController = self.storyboard?.instantiateViewController(withIdentifier: "newCreditCardRiderObj") as! RiderCreditCardDetailTableViewController
           riderCardViewController.checkFlag = myStringValue*/

        
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
    
    @IBAction func registerRiderTapped(_ sender: AnyObject) {
        //let zipRide = UserDefaults.standard
        let token = UserDefaults.standard.string(forKey: "stptoken")
        //print(token)
          if(rdFirstName.text == "")
          {
             rdFirstName.becomeFirstResponder()
             displayAlert(messageToDisplay: "Please enter First name")
            success = 0
          }
          else if(rdMiddleName.text == "")
          {
             rdMiddleName.becomeFirstResponder()
             displayAlert(messageToDisplay: "Please enter Middle name")
            success = 0
          }
          else if(rdLastName.text == "")
          {
             rdLastName.becomeFirstResponder()
             displayAlert(messageToDisplay: "Please enter Last name")
            success = 0
          }
          else if(rdEmail.text == "")
          {
            rdEmail.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Email")
            success = 0
          }
          else if(rdPassword.text == "")
          {
            rdPassword.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Password")
            success = 0
          }
          else if(rdConfirmPassword.text == "")
          {
            rdConfirmPassword.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Confirm password")
            success = 0
          }
          else if(rdAddress1.text == "")
          {
            rdAddress1.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Address1")
            success = 0
          }
          else if(rdAddress2.text == "")
          {
            rdAddress2.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Address2")
            success = 0
          }
          else if(rdCity.text == "")
          {
            rdCity.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter City")
            success = 0
          }
          else if(rdState.text == "")
          {
            rdState.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter State")
            success = 0
          }
          else if(rdZip.text == "")
          {
            rdZip.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Zip")
            success = 0
          }
          else if(rdPhoneNumber.text == "")
          {
            rdPhoneNumber.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Phone number")
            success = 0
          }
        
          else
          {
            let provideEmailAddress = rdEmail.text
            let isEmailValid = isEmailAddress(emailAddressString:provideEmailAddress!)
            
            let providePwordchk = rdPassword.text
            let provideConfirmPword = rdConfirmPassword.text
            let isConfirmPwordValid = PasswordSame(password:providePwordchk!,confirmpassword:provideConfirmPword!)
            
            let provideZip = rdZip.text
            let isZipValid = validateZip(value:provideZip!)
            
            let provideMobile = rdPhoneNumber.text
            let isMobValid = validateMobile(value:provideMobile!)
            
            if isEmailValid != true {
                displayAlert(messageToDisplay: "Invalid Mail ID")
                rdEmail.becomeFirstResponder()
                success = 0
            }
            else if isConfirmPwordValid != true{
                displayAlert(messageToDisplay: "Password Mismatch")
                rdPassword.becomeFirstResponder()
                success = 0
            }
            else if isZipValid != true{
                displayAlert(messageToDisplay: "Incorrect Zip Code")
                rdZip.becomeFirstResponder()
                success = 0
            }
            else if isMobValid != true{
                displayAlert(messageToDisplay: "Incorrect Mobile No")
                rdPhoneNumber.becomeFirstResponder()
                success = 0
            }
            else
            {

            success = 1
            if(success == 1)
            {
                SVProgressHUD.show(withStatus: "Registering Rider")
                var retData = "firstName="+rdFirstName.text!
                retData += "&middleName="+rdMiddleName.text!
                retData += "&lastName="+rdLastName.text!
                retData += "&email="+rdEmail.text!
                retData += "&password="+rdPassword.text!
                retData += "&address1="+rdAddress1.text!
                retData += "&address2="+rdAddress2.text!
                retData += "&city="+rdCity.text!
                retData += "&state="+rdState.text!
                retData += "&zip="+rdZip.text!
                retData += "&phone="+rdPhoneNumber.text!
                
                
                let adder1Rid = UserDefaults.standard
                let adder1RidKeyValue = adder1Rid.string(forKey: "add1Key")
                
                let adder2Rid = UserDefaults.standard
                let adder2RidKeyValue = adder2Rid.string(forKey: "add2Key")
                
                let cityRide = UserDefaults.standard
                let cityRideValue = cityRide.string(forKey: "cityKey")
                
                let stateRide = UserDefaults.standard
                let stateRideKeyValue = stateRide.string(forKey: "stateKey")
                                
                let zipRide = UserDefaults.standard
                let zipRideKeyValue = zipRide.string(forKey: "zipKey")
                
                
                
                retData += "&status=A&deviceId=I&devicetoken=1&deviceType=I&cardType=d&cardProvider=m&cardBillingAddress1="+adder1RidKeyValue!+"&cardBillingAddress2="+adder2RidKeyValue!+"&cardBillingCity="+cityRideValue!+"&cardBillingState="+stateRideKeyValue!+"&cardBillingZip="+zipRideKeyValue!+"&cardToken="+token!
                
                let postString=retData
                
                var request = URLRequest(url: URL(string: "http://bzride.com/bzride/RegisterRider.php")!)
                request.httpMethod = "POST"
                
                 print("postString is ==============\(postString)")
                
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
                        let info = dict["info"]
                        
                        if(status == "S")
                        {
                            SVProgressHUD.dismiss()
                                                       
                            let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "firstView") as! ViewController
                            self.navigationController?.pushViewController(firstViewController, animated: true)
                            
                            
                        }
                        else
                        {
                            SVProgressHUD.dismiss()
                            let alertController = UIAlertController(title:"",message:info,preferredStyle:.alert)
                            let OkAction = UIAlertAction(title:"OK", style:.default)
                            alertController.addAction(OkAction)
                            self.present(alertController,animated:true,completion:nil)
                        }
                    }
                    catch let error as NSError{
                        print("error = \(error)")
                    }
                    
                }
                task.resume()
          }
            }
        }
       }
}
