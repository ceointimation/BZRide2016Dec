//
//  riderRegisterTableViewController.swift
//  BZRide
//
//  Created by Sooraj on 11/16/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class riderRegisterTableViewController: UITableViewController {

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
        
       /* let provideEmailAddress = rdEmail.text
        let isEmailValid = isEmailAddress(emailAddressString:provideEmailAddress!)
        if isEmailValid != true {
            rdEmail.becomeFirstResponder()
            displayAlert(messageToDisplay: "Invalid Mail ID")
        }*/
        
        let dict:[String] = [rdEmail.text!]
        UserDefaults.standard.set(dict, forKey: "dict")
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
          if(rdFirstName.text == "")
          {
             rdFirstName.becomeFirstResponder()
             displayAlert(messageToDisplay: "Please enter First name")
          }
          else if(rdMiddleName.text == "")
          {
             rdMiddleName.becomeFirstResponder()
             displayAlert(messageToDisplay: "Please enter Middle name")
          }
          else if(rdLastName.text == "")
          {
             rdLastName.becomeFirstResponder()
             displayAlert(messageToDisplay: "Please enter Last name")
          }
          else if(rdEmail.text == "")
          {
            rdEmail.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Email")
          }
          else if(rdPassword.text == "")
          {
            rdPassword.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Password")
          }
          else if(rdConfirmPassword.text == "")
          {
            rdConfirmPassword.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Confirm password")
          }
          else if(rdAddress1.text == "")
          {
            rdAddress1.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Address1")
          }
          else if(rdAddress2.text == "")
          {
            rdAddress2.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Address2")
          }
          else if(rdCity.text == "")
          {
            rdCity.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter City")
          }
          else if(rdState.text == "")
          {
            rdState.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter State")
          }
          else if(rdZip.text == "")
          {
            rdZip.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Zip")
          }
          else if(rdPhoneNumber.text == "")
          {
            rdPhoneNumber.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Phone number")
          }
          else
          {
            let provideEmailAddress = rdEmail.text
            let isEmailValid = isEmailAddress(emailAddressString:provideEmailAddress!)
            if isEmailValid != true {
                rdEmail.becomeFirstResponder()
                displayAlert(messageToDisplay: "Invalid Mail ID")
            }
            
            let providePwordchk = rdPassword.text
            let provideConfirmPword = rdConfirmPassword.text
            let isConfirmPwordValid = PasswordSame(password:providePwordchk!,confirmpassword:provideConfirmPword!)
            if isConfirmPwordValid != true{
                rdPassword.becomeFirstResponder()
                displayAlert(messageToDisplay: "Password Mismatch")
            }
            
            let provideZip = rdZip.text
            let isZipValid = validateZip(value:provideZip!)
            if isZipValid != true{
                rdZip.becomeFirstResponder()
                displayAlert(messageToDisplay: "Incorrect Zip Code")
            }

            let provideMobile = rdPhoneNumber.text
            let isMobValid = validateMobile(value:provideMobile!)
            if isMobValid != true{
                rdPhoneNumber.becomeFirstResponder()
                displayAlert(messageToDisplay: "Incorrect Mobile No")
             }
               else
            {
                displayAlert(messageToDisplay: "Routing to PHP")
            }
            
          }
        
    }
}