//
//  LicenseTableViewController.swift
//  BZRide
//
//  Created by Kyeesha Technologies on 12/9/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class LicenseTableViewController: UITableViewController {
    
    var dataDispCheck4:Int?
    
    @IBOutlet weak var licenseNumber: UITextField!
    @IBOutlet weak var licenseStateIssue: UITextField!
    @IBOutlet weak var licenseDateIssue: UITextField!
    @IBOutlet weak var licenseDateExpiry: UITextField!

    var regDateFlag:String?
    var expDateFlag:String?
    var dateCheckFlag:Int?
    
    @IBOutlet weak var licenseDone: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor=UIColor.red
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(LicenseTableViewController.goBack))
        navigationItem.leftBarButtonItem = backButton
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        self.tableView.addGestureRecognizer(tapGesture1)
      if(dataDispCheck4 == 2)
      {
        
        if(dateCheckFlag == 1)
        {
            licenseDateIssue.text = regDateFlag
            
            let drLicenseIssDate = UserDefaults.standard
            drLicenseIssDate.set(licenseDateIssue.text!, forKey: "drLicenseIssDateKey")
        }
        else if(dateCheckFlag == 2)
        {
            licenseDateExpiry.text = expDateFlag
            
            let drLicenseExpDate = UserDefaults.standard
            drLicenseExpDate.set(licenseDateExpiry.text!, forKey: "drLicenseExpDateKey")
            
        }
        
        let drLicenseNumber = UserDefaults.standard
        let drLicenseNumberKeyValue = drLicenseNumber.string(forKey: "drLicenseNumberKey")
        licenseNumber.text = drLicenseNumberKeyValue
        
        let drLicenseStateIssue = UserDefaults.standard
        let drLicenseStateIssueKeyValue = drLicenseStateIssue.string(forKey: "drLicenseStateIssueKey")
        licenseStateIssue.text = drLicenseStateIssueKeyValue
        
        let drLicenseIssDate = UserDefaults.standard
        let drLicenseIssDateKeyValue = drLicenseIssDate.string(forKey: "drLicenseIssDateKey")
        licenseDateIssue.text = drLicenseIssDateKeyValue
        
        let drLicenseExpDate = UserDefaults.standard
        let drLicenseExpDateKeyValue = drLicenseExpDate.string(forKey: "drLicenseExpDateKey")
        licenseDateExpiry.text = drLicenseExpDateKeyValue
    }
    }
    func goBack(){
        dismiss(animated: true, completion: nil)
    }
    func tapBlurButton(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    func displayAlert(messageToDisplay:String){
        let alertController = UIAlertController(title:"",message:messageToDisplay,preferredStyle:.alert)
        
        let OkAction = UIAlertAction(title:"OK", style:.default)
        alertController.addAction(OkAction)
        self.present(alertController,animated:true,completion:nil)
    }
    
    
    @IBAction func licIssDateClick(_ sender: AnyObject) {
        let drLicenseNumber = UserDefaults.standard
        drLicenseNumber.set(licenseNumber.text!, forKey: "drLicenseNumberKey")
        
        let drLicenseStateIssue = UserDefaults.standard
        drLicenseStateIssue.set(licenseStateIssue.text!, forKey: "drLicenseStateIssueKey")
        
        let datePickerViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDatePicker") as! DatePickerViewController
        datePickerViewController.dateFlag = 1
        datePickerViewController.viewControllerFlag = 3
        self.navigationController?.pushViewController(datePickerViewController, animated: true)
    }
    
    @IBAction func licExpDateClick(_ sender: AnyObject) {
        let drLicenseNumber = UserDefaults.standard
        drLicenseNumber.set(licenseNumber.text!, forKey: "drLicenseNumberKey")
        
        let drLicenseStateIssue = UserDefaults.standard
        drLicenseStateIssue.set(licenseStateIssue.text!, forKey: "drLicenseStateIssueKey")
        
        let datePickerViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDatePicker") as! DatePickerViewController
        datePickerViewController.dateFlag = 2
        datePickerViewController.viewControllerFlag = 3
        self.navigationController?.pushViewController(datePickerViewController, animated: true)
    }
    
    
    @IBAction func licenseDoneTapped(_ sender: AnyObject) {
        if(licenseNumber.text == "")
        {
            licenseNumber.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter License Number")
        }
        else if(licenseStateIssue.text == "")
        {
            licenseStateIssue.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter License state")
        }
        else if(licenseDateIssue.text == "")
        {
            //licenseDateIssue.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Issue Date")
        }
        else if(licenseDateExpiry.text == "")
        {
            //licenseDateExpiry.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Expiry Date")
        }
        else
        {
            let drLicenseNumber = UserDefaults.standard
            drLicenseNumber.set(licenseNumber.text!, forKey: "drLicenseNumberKey")
            
            let drLicenseStateIssue = UserDefaults.standard
            drLicenseStateIssue.set(licenseStateIssue.text!, forKey: "drLicenseStateIssueKey")
            
            let drLicenseIssDate = UserDefaults.standard
            drLicenseIssDate.set(licenseDateIssue.text!, forKey: "drLicenseIssDateKey")
            
            let drLicenseExpDate = UserDefaults.standard
            drLicenseExpDate.set(licenseDateExpiry.text!, forKey: "drLicenseExpDateKey")
            
            let vehicleViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDriverRegTabView") as! DriverRegisterTableViewController
            vehicleViewController.myStringValue = 2
            self.navigationController?.pushViewController(vehicleViewController, animated: true)
        }
    }
}
