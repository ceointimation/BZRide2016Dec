//
//  VehicleRegistrationTableViewController.swift
//  BZRide
//
//  Created by Kyeesha Technologies on 12/9/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class VehicleRegistrationTableViewController: UITableViewController {
    
    var dataDispCheck2:Int?
    var dateFlagChecking:Int?
    
    @IBOutlet weak var vehicleNumPlate: UITextField!
    @IBOutlet weak var vehicleState: UITextField!
    @IBOutlet weak var vehicleRegDate: UITextField!
    @IBOutlet weak var vehicleExpDate: UITextField!
   
    var regDateFlag:String?
    var expDateFlag:String?
    var dateCheckFlag:Int?
    
    
    @IBOutlet weak var vehicleRegDone: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor=UIColor.red
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(VehicleRegistrationTableViewController.goBack))
        navigationItem.leftBarButtonItem = backButton
       
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        self.tableView.addGestureRecognizer(tapGesture1)
        
    if(dataDispCheck2 == 2)
    {
        
        if(dateCheckFlag == 1)
        {
            vehicleRegDate.text = regDateFlag
            let drVehicleRegDate = UserDefaults.standard
            drVehicleRegDate.set(vehicleRegDate.text!, forKey: "drVehicleRegDateKey")
        }
        else if(dateCheckFlag == 2)
        {
            vehicleExpDate.text = expDateFlag
            let drVehicleExpDate = UserDefaults.standard
            drVehicleExpDate.set(vehicleExpDate.text!, forKey: "drVehicleExpDateKey")

        }
      
        let drVehicleNumPlate = UserDefaults.standard
        let drVehicleNumPlateKey = drVehicleNumPlate.string(forKey: "drVehicleNumPlateKey")
        vehicleNumPlate.text = drVehicleNumPlateKey
        
        let drVehicleState = UserDefaults.standard
        let drVehicleStateKeyValue = drVehicleState.string(forKey: "drVehicleStateKey")
        vehicleState.text = drVehicleStateKeyValue
             
        let drVehicleRegDate = UserDefaults.standard
        let drVehicleRegDateKeyValue = drVehicleRegDate.string(forKey: "drVehicleRegDateKey")
       
            vehicleRegDate.text = drVehicleRegDateKeyValue
        
        let drVehicleExpDate = UserDefaults.standard
        let drVehicleExpDateKeyValue = drVehicleExpDate.string(forKey: "drVehicleExpDateKey")
        
            vehicleExpDate.text = drVehicleExpDateKeyValue
        
    }
    }
    func goBack(){
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func dateRegisterClick(_ sender: AnyObject) {
        
        let drVehicleNumPlate = UserDefaults.standard
        drVehicleNumPlate.set(vehicleNumPlate.text!, forKey: "drVehicleNumPlateKey")
        
        let drVehicleState = UserDefaults.standard
        drVehicleState.set(vehicleState.text!, forKey: "drVehicleStateKey")
        
        let datePickerViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDatePicker") as! DatePickerViewController
        datePickerViewController.dateFlag = 1
        datePickerViewController.viewControllerFlag = 1
        self.navigationController?.pushViewController(datePickerViewController, animated: true)
        
        
    }
    
    @IBAction func dateExpiryClick(_ sender: AnyObject) {
        
        let drVehicleNumPlate = UserDefaults.standard
        drVehicleNumPlate.set(vehicleNumPlate.text!, forKey: "drVehicleNumPlateKey")
        
        let drVehicleState = UserDefaults.standard
        drVehicleState.set(vehicleState.text!, forKey: "drVehicleStateKey")
        
        let datePickerViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDatePicker") as! DatePickerViewController
        datePickerViewController.dateFlag = 2
         datePickerViewController.viewControllerFlag = 1
        self.navigationController?.pushViewController(datePickerViewController, animated: true)
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
    @IBAction func vehicleRegistrationTapped(_ sender: AnyObject) {
        if(vehicleNumPlate.text == "")
        {
            vehicleNumPlate.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Vehicle Number")
        }
        else if(vehicleState.text == "")
        {
            vehicleState.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Vehicle State")
        }
        else if(vehicleRegDate.text == "")
        {
            //vehicleRegDate.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Registration Date")
        }
        else if(vehicleExpDate.text == "")
        {
            //vehicleExpDate.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Expiry Date")
        }
        else
        {
            let drVehicleNumPlate = UserDefaults.standard
            drVehicleNumPlate.set(vehicleNumPlate.text!, forKey: "drVehicleNumPlateKey")
            
            let drVehicleState = UserDefaults.standard
            drVehicleState.set(vehicleState.text!, forKey: "drVehicleStateKey")
            
            let drVehicleRegDate = UserDefaults.standard
            drVehicleRegDate.set(vehicleRegDate.text!, forKey: "drVehicleRegDateKey")
            
            let drVehicleExpDate = UserDefaults.standard
            drVehicleExpDate.set(vehicleExpDate.text!, forKey: "drVehicleExpDateKey")
            
            let vehicleViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDriverRegTabView") as! DriverRegisterTableViewController
            vehicleViewController.myStringValue = 2
            self.navigationController?.pushViewController(vehicleViewController, animated: true)
        }
        

    }
}
