//
//  DriverVehicleTableViewController.swift
//  BZRide
//
//  Created by Kyeesha Technologies on 12/9/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class DriverVehicleTableViewController: UITableViewController {

    var dataDispCheck1:Int?
    
    @IBOutlet weak var vehYearManufacture: UITextField!
    @IBOutlet weak var vehicleModel: UITextField!
    @IBOutlet weak var vehicleMake: UITextField!
    @IBOutlet weak var vehicleColor: UITextField!
  
    @IBOutlet weak var vehicleDone: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor=UIColor.red
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DriverVehicleTableViewController.goBack))
        navigationItem.leftBarButtonItem = backButton
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        self.tableView.addGestureRecognizer(tapGesture1)
   if(dataDispCheck1 == 2)
   {
            
        let drVehicleYear = UserDefaults.standard
        let drVehicleYearKeyValue = drVehicleYear.string(forKey: "drVehicleYearKey")
        vehYearManufacture.text = drVehicleYearKeyValue
        
        let drVehicleModel = UserDefaults.standard
        let drVehicleModelKeyValue = drVehicleModel.string(forKey: "drVehicleModelKey")
        vehicleModel.text = drVehicleModelKeyValue
        
        let drvehicleMake = UserDefaults.standard
        let drvehicleMakeKeyValue = drvehicleMake.string(forKey: "drvehicleMakeKey")
        vehicleMake.text = drvehicleMakeKeyValue
        
        let drvehicleColor = UserDefaults.standard
        let drvehicleColorKeyValue = drvehicleColor.string(forKey: "drvehicleColorKey")
        vehicleColor.text = drvehicleColorKeyValue
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


    @IBAction func vehicleDoneTapped(_ sender: AnyObject) {
        if(vehYearManufacture.text == "")
        {
            vehYearManufacture.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Year of Manufacture")
        }
        else if(vehicleModel.text == "")
        {
            vehicleModel.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Vehicle Model")
        }
        else if(vehicleMake.text == "")
        {
            vehicleMake.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Vehicle Make")
        }
        else if(vehicleColor.text == "")
        {
            vehicleColor.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Vehicle Color")
        }
        else
        {
            let drVehicleYear = UserDefaults.standard
            drVehicleYear.set(vehYearManufacture.text!, forKey: "drVehicleYearKey")
            
            let drVehicleModel = UserDefaults.standard
            drVehicleModel.set(vehicleModel.text!, forKey: "drVehicleModelKey")
            
            let drvehicleMake = UserDefaults.standard
            drvehicleMake.set(vehicleMake.text!, forKey: "drvehicleMakeKey")
            
            let drvehicleColor = UserDefaults.standard
            drvehicleColor.set(vehicleColor.text!, forKey: "drvehicleColorKey")

            
            let vehicleViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDriverRegTabView") as! DriverRegisterTableViewController
            vehicleViewController.myStringValue = 2
            self.navigationController?.pushViewController(vehicleViewController, animated: true)
        }

        
    }
    
}
