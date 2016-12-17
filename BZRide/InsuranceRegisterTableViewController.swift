//
//  InsuranceRegisterTableViewController.swift
//  BZRide
//
//  Created by Kyeesha Technologies on 12/9/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class InsuranceRegisterTableViewController: UITableViewController {
   
    var dataDispCheck3:Int?
   
    @IBOutlet weak var drInsCompany: UITextField!
    @IBOutlet weak var drInsNumber: UITextField!
    @IBOutlet weak var drInsRegDate: UITextField!
    @IBOutlet weak var drInsExpDate: UITextField!

    var regDateFlag:String?
    var expDateFlag:String?
    var dateCheckFlag:Int?
    
    @IBOutlet weak var drInsuranceDone: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor=UIColor.red
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(InsuranceRegisterTableViewController.goBack))
        navigationItem.leftBarButtonItem = backButton
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        self.tableView.addGestureRecognizer(tapGesture1)
        
     if(dataDispCheck3 == 2)
     {
        if(dateCheckFlag == 1)
        {
            drInsRegDate.text = regDateFlag
            
            let drInsuranceRegDate = UserDefaults.standard
            drInsuranceRegDate.set(drInsRegDate.text!, forKey: "drInsuranceRegDateKey")
        }
        else if(dateCheckFlag == 2)
        {
            drInsExpDate.text = expDateFlag
            
            let drInsuranceExpDate = UserDefaults.standard
            drInsuranceExpDate.set(drInsExpDate.text!, forKey: "drInsuranceExpDateKey")
            
        }
        
        let drInsuranceCompany = UserDefaults.standard
        let drInsuranceCompanyKeyValue = drInsuranceCompany.string(forKey: "drInsuranceCompanyKey")
        drInsCompany.text = drInsuranceCompanyKeyValue
        
        let drInsuranceNumber = UserDefaults.standard
        let drInsuranceNumberKeyValue = drInsuranceNumber.string(forKey: "drInsuranceNumberKey")
        drInsNumber.text = drInsuranceNumberKeyValue
        
        let drInsuranceRegDate = UserDefaults.standard
        let drInsuranceRegDateKeyValue = drInsuranceRegDate.string(forKey: "drInsuranceRegDateKey")
        drInsRegDate.text = drInsuranceRegDateKeyValue
        
        let drInsuranceExpDate = UserDefaults.standard
        let drInsuranceExpDateValue = drInsuranceExpDate.string(forKey: "drInsuranceExpDateKey")
        drInsExpDate.text = drInsuranceExpDateValue
        
    }
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

    @IBAction func insRegDateClick(_ sender: AnyObject) {
        let drInsuranceCompany = UserDefaults.standard
        drInsuranceCompany.set(drInsCompany.text!, forKey: "drInsuranceCompanyKey")
        
        let drInsuranceNumber = UserDefaults.standard
        drInsuranceNumber.set(drInsNumber.text!, forKey: "drInsuranceNumberKey")
        
        let datePickerViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDatePicker") as! DatePickerViewController
        datePickerViewController.dateFlag = 1
        datePickerViewController.viewControllerFlag = 2
        self.navigationController?.pushViewController(datePickerViewController, animated: true)
    }
    
    @IBAction func insDateExpClick(_ sender: AnyObject) {
        let drInsuranceCompany = UserDefaults.standard
        drInsuranceCompany.set(drInsCompany.text!, forKey: "drInsuranceCompanyKey")
        
        let drInsuranceNumber = UserDefaults.standard
        drInsuranceNumber.set(drInsNumber.text!, forKey: "drInsuranceNumberKey")
        
        let datePickerViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDatePicker") as! DatePickerViewController
        datePickerViewController.dateFlag = 2
        datePickerViewController.viewControllerFlag = 2
        self.navigationController?.pushViewController(datePickerViewController, animated: true)
    }
    
    @IBAction func insuranceDoneTapped(_ sender: AnyObject) {
        if(drInsCompany.text == "")
        {
            drInsCompany.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Insurance Company")
        }
        else if(drInsNumber.text == "")
        {
            drInsNumber.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Insurance Number")
        }
        else if(drInsRegDate.text == "")
        {
            //drInsRegDate.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Insurance Date")
        }
        else if(drInsExpDate.text == "")
        {
           // drInsExpDate.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Expiry Date")
        }
        else
        {
            let drInsuranceCompany = UserDefaults.standard
            drInsuranceCompany.set(drInsCompany.text!, forKey: "drInsuranceCompanyKey")
            
            let drInsuranceNumber = UserDefaults.standard
            drInsuranceNumber.set(drInsNumber.text!, forKey: "drInsuranceNumberKey")
            
            let drInsuranceExpDate = UserDefaults.standard
            drInsuranceExpDate.set(drInsRegDate.text!, forKey: "drInsuranceRegDateKey")
            
            let drInsuranceRegDate = UserDefaults.standard
            drInsuranceRegDate.set(drInsExpDate.text!, forKey: "drInsuranceExpDateKey")
            
            let vehicleViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDriverRegTabView") as! DriverRegisterTableViewController
            vehicleViewController.myStringValue = 2
            self.navigationController?.pushViewController(vehicleViewController, animated: true)
        }
        

    }
}
