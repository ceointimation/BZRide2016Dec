var holderNameCrd =  UITextField()//
//  RiderCreditCardDetTableViewController.swift
//  BZRide
//
//  Created by Kyeesha Technologies on 12/1/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class RiderCreditCardDetTableViewController: UITableViewController,STPPaymentCardTextFieldDelegate {
    
    var checkFlag:Int?
    
    var creditCardNum =  STPPaymentCardTextField()
    var holderNameCrd =  UITextField()
    //var emailCrd =  UITextField()
    var add1Crd =  UITextField()
    var add2Crd =  UITextField()
    var cityCrd =  UITextField()
    var stateCrd =  UITextField()
    var zipCrd =  UITextField()
    var doneButton = UIButton()
   
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        self.tableView.rowHeight = 55
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        self.tableView.addGestureRecognizer(tapGesture1)
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DriverRegViewController.goBack))
        navigationItem.leftBarButtonItem = backButton
        
         let a = Int(UIScreen.main.bounds.size.width)
         creditCardNum.frame = CGRect(x: 40, y: 12, width: a-80, height: Int(40.00));
         creditCardNum.backgroundColor =  UIColor.white
        
        holderNameCrd.frame = CGRect(x: 40, y: 12, width: a-80, height: Int(40.00));
        holderNameCrd.backgroundColor =  UIColor.white
        holderNameCrd.placeholder = "Account holder name"
        
        /*emailCrd.frame = CGRect(x: 40, y: 12, width: a-80, height: Int(40.00));
        emailCrd.backgroundColor =  UIColor.white
    
        let defaults = UserDefaults.standard
        let mailKey = defaults.string(forKey: "emailKey")
        emailCrd.text = mailKey*/
        
        add1Crd.frame = CGRect(x: 40, y: 12, width: a-80, height: Int(40.00));
        add1Crd.backgroundColor =  UIColor.white
        add1Crd.placeholder = "Card billing add1"
        
        add2Crd.frame = CGRect(x: 40, y: 12, width: a-80, height: Int(40.00));
        add2Crd.backgroundColor =  UIColor.white
        add2Crd.placeholder = "Card billing add2"
        
        cityCrd.frame = CGRect(x: 40, y: 12, width: a-80, height: Int(40.00));
        cityCrd.backgroundColor =  UIColor.white
        cityCrd.placeholder = "City"
        
        stateCrd.frame = CGRect(x: 40, y: 12, width: a-80, height: Int(40.00));
        stateCrd.backgroundColor =  UIColor.white
        stateCrd.placeholder = "State"
        
        zipCrd.frame = CGRect(x: 40, y: 12, width: a-80, height: Int(40.00));
        zipCrd.backgroundColor =  UIColor.white
        zipCrd.placeholder = "Zip"
        
        doneButton.frame = CGRect(x: 60, y: 15, width:a-120, height: Int(36.00))  //set frame
        doneButton.backgroundColor =  UIColor.blue
        doneButton.setTitleColor(UIColor.white, for: .normal)
        doneButton.setTitle("DONE", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonTap), for: .touchUpInside)
        if (checkFlag == 2)
        {
            
            let accHldrName = UserDefaults.standard
            let accHldrNameValue = accHldrName.string(forKey: "holderKey")
            holderNameCrd.text = accHldrNameValue
            
            let adder1Rid = UserDefaults.standard
            let adder1RidKeyValue = adder1Rid.string(forKey: "add1Key")
            add1Crd.text = adder1RidKeyValue
            
            let adder2Rid = UserDefaults.standard
            let adder2RidKeyValue = adder2Rid.string(forKey: "add2Key")
            add2Crd.text = adder2RidKeyValue
            
            let cityRide = UserDefaults.standard
            let cityRideValue = cityRide.string(forKey: "cityKey")
            cityCrd.text = cityRideValue
            
            let stateRide = UserDefaults.standard
            let stateRideKeyValue = stateRide.string(forKey: "stateKey")
            stateCrd.text = stateRideKeyValue
            
            let zipRide = UserDefaults.standard
            let zipRideKeyValue = zipRide.string(forKey: "zipKey")
            zipCrd.text = zipRideKeyValue
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }

   /* func tableView(tableView: UITableView,
                   heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }*/

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "riderCell", for: indexPath)
        if(indexPath.row == 0)
        {
            cell.addSubview(creditCardNum)
            
        }
        else if(indexPath.row == 1)
        {
            cell.addSubview(holderNameCrd)
            
        }
      /*  else if(indexPath.row == 2)
        {
            cell.addSubview(emailCrd)
            
        }*/
        else if(indexPath.row == 2)
        {
            
            cell.addSubview(add1Crd)
           
        }
        else if(indexPath.row == 3)
        {
            cell.addSubview(add2Crd)
            
        }
        else if(indexPath.row == 4)
        {
            
            cell.addSubview(cityCrd)
            
        }
        else if(indexPath.row == 5)
        {
            
            cell.addSubview(stateCrd)
        }
        else if(indexPath.row == 6)
        {
            
            cell.addSubview(zipCrd)
        }
        else if(indexPath.row == 7)
        {
            
            cell.addSubview(doneButton)
        }
        
        //cell.backgroundColor = UIColor.red

        // Configure the cell...
       
        

        return cell
    }
    func displayAlert(messageToDisplay:String){
        let alertController = UIAlertController(title:"",message:messageToDisplay,preferredStyle:.alert)
        
        let OkAction = UIAlertAction(title:"OK", style:.default)
        alertController.addAction(OkAction)
        self.present(alertController,animated:true,completion:nil)
    }
    // validate zip code
    func validateZip(value: String) -> Bool {
        let ZIP_REGEX = "^\\d{6}$"
        let zipTest = NSPredicate(format: "SELF MATCHES %@", ZIP_REGEX)
        let result =  zipTest.evaluate(with: value)
        return result
    }
 @IBAction func doneButtonTap(_ sender: AnyObject) {
        if(holderNameCrd.text == "")
        {
            holderNameCrd.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Account Holder name")
        }
        else if(add1Crd.text == "")
        {
            add1Crd.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Address1")
        }
        else if(add2Crd.text == "")
        {
            add2Crd.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Address2")
        }
        else if(cityCrd.text == "")
        {
            cityCrd.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter City")
        }
        else if(stateCrd.text == "")
        {
            stateCrd.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter State")
        }
        else if(zipCrd.text == "")
        {
            zipCrd.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Zip")
        }
        else
        {
            let provideZip = zipCrd.text
            let isZipValid = validateZip(value:provideZip!)
            if isZipValid != true{
            zipCrd.becomeFirstResponder()
            displayAlert(messageToDisplay: "Incorrect Zip Code")
        }
      }
   
    
 
    let accHolder = UserDefaults.standard
    accHolder.set(holderNameCrd.text!, forKey: "holderKey")
    
    let add1C = UserDefaults.standard
    add1C.set(add1Crd.text!, forKey: "add1Key")
    
    let add2C = UserDefaults.standard
    add2C.set(add2Crd.text!, forKey: "add2Key")
    
    let cityC = UserDefaults.standard
    cityC.set(cityCrd.text!, forKey: "cityKey")
    
    let stateC = UserDefaults.standard
    stateC.set(stateCrd.text!, forKey: "stateKey")
    
    let zipC = UserDefaults.standard
    zipC.set(zipCrd.text!, forKey: "zipKey")
        
    let riderRegViewController = self.storyboard?.instantiateViewController(withIdentifier: "newRiderRegView") as! riderRegisterTableViewController
    riderRegViewController.myStringValue = 2
    self.navigationController?.pushViewController(riderRegViewController, animated: true)

    
    
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
