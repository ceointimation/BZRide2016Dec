//
//  DatePickerViewController.swift
//  BZRide
//
//  Created by Kyeesha Technologies on 12/14/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
     var dateFlag:Int?
    var viewControllerFlag:Int?
    
    @IBOutlet weak var datePick: UIDatePicker!
    @IBOutlet weak var DateDone: UIButton!
    @IBOutlet weak var cancelDone: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor=UIColor.red

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dateDoneTapped(_ sender: AnyObject) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let strDate = dateFormatter.string(from: datePick.date)
        
     if(viewControllerFlag == 1)
     {
        if(dateFlag == 1)
        {
        
        let dateSetterViewController = self.storyboard?.instantiateViewController(withIdentifier: "newVehicleRegisterTabView") as! VehicleRegistrationTableViewController
        dateSetterViewController.regDateFlag = strDate
            dateSetterViewController.dateCheckFlag = 1
            dateSetterViewController.dataDispCheck2 = 2
            dateSetterViewController.dateFlagChecking = 1
        self.navigationController?.pushViewController(dateSetterViewController, animated: true)
        }
        else if(dateFlag == 2)
        {
            let dateSetterViewController = self.storyboard?.instantiateViewController(withIdentifier: "newVehicleRegisterTabView") as! VehicleRegistrationTableViewController
            dateSetterViewController.expDateFlag = strDate
            dateSetterViewController.dateCheckFlag = 2
            dateSetterViewController.dataDispCheck2 = 2
            dateSetterViewController.dateFlagChecking = 2
            self.navigationController?.pushViewController(dateSetterViewController, animated: true)
        }
     }
    else if(viewControllerFlag == 2)
    {
        if(dateFlag == 1)
        {
            
            let dateSetterViewController = self.storyboard?.instantiateViewController(withIdentifier: "newInsuranceRegisterTabView") as! InsuranceRegisterTableViewController
            dateSetterViewController.regDateFlag = strDate
            dateSetterViewController.dateCheckFlag = 1
             dateSetterViewController.dataDispCheck3 = 2
            self.navigationController?.pushViewController(dateSetterViewController, animated: true)
        }
        else if(dateFlag == 2)
        {
            let dateSetterViewController = self.storyboard?.instantiateViewController(withIdentifier: "newInsuranceRegisterTabView") as! InsuranceRegisterTableViewController
            dateSetterViewController.expDateFlag = strDate
            dateSetterViewController.dateCheckFlag = 2
             dateSetterViewController.dataDispCheck3 = 2
            self.navigationController?.pushViewController(dateSetterViewController, animated: true)
        }
    
    }
     else if(viewControllerFlag == 3)
     {
        if(dateFlag == 1)
        {
            
            let dateSetterViewController = self.storyboard?.instantiateViewController(withIdentifier: "newILicenseRegisterTabView") as! LicenseTableViewController
            dateSetterViewController.regDateFlag = strDate
            dateSetterViewController.dateCheckFlag = 1
            dateSetterViewController.dataDispCheck4 = 2
            self.navigationController?.pushViewController(dateSetterViewController, animated: true)
        }
        else if(dateFlag == 2)
        {
            let dateSetterViewController = self.storyboard?.instantiateViewController(withIdentifier: "newILicenseRegisterTabView") as! LicenseTableViewController
            dateSetterViewController.expDateFlag = strDate
            dateSetterViewController.dateCheckFlag = 2
            dateSetterViewController.dataDispCheck4 = 2
            self.navigationController?.pushViewController(dateSetterViewController, animated: true)
        }
        
        }
        

    }
    
    @IBAction func dateCancelTapped(_ sender: AnyObject) {
        if(viewControllerFlag == 1)
        {
            
                let dateSetterViewController = self.storyboard?.instantiateViewController(withIdentifier: "newVehicleRegisterTabView") as! VehicleRegistrationTableViewController
                    dateSetterViewController.dataDispCheck2 = 2
                self.navigationController?.pushViewController(dateSetterViewController, animated: true)
            }
            
        else if(viewControllerFlag == 2)
        {
    
             let dateSetterViewController = self.storyboard?.instantiateViewController(withIdentifier: "newInsuranceRegisterTabView") as! InsuranceRegisterTableViewController
             dateSetterViewController.dataDispCheck3 = 2
             self.navigationController?.pushViewController(dateSetterViewController, animated: true)
                           }
        else if(viewControllerFlag == 3)
        {
            
            let dateSetterViewController = self.storyboard?.instantiateViewController(withIdentifier: "newILicenseRegisterTabView") as! LicenseTableViewController
             dateSetterViewController.dataDispCheck4 = 2
            self.navigationController?.pushViewController(dateSetterViewController, animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
