//
//  RiderCreditCardDetTableViewController.swift
//  BZRide
//
//  Created by Kyeesha Technologies on 12/1/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class RiderCreditCardDetTableViewController: UITableViewController,STPPaymentCardTextFieldDelegate {
    
    var checkFlag:Int?
    
    var creditCardNum =  UITextField()
    var holderNameCrd =  UITextField()
    var add1Crd =  UITextField()
    var add2Crd =  UITextField()
    var cityCrd =  UITextField()
    var stateCrd =  UITextField()
    var zipCrd =  UITextField()
    var monthCrd =  UITextField()
    var yearCrd =  UITextField()
    var cvcCrd =  UITextField()
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
         creditCardNum .keyboardType = UIKeyboardType.numberPad
         creditCardNum.placeholder = "Credit card number"
        
        holderNameCrd.frame = CGRect(x: 40, y: 12, width: a-80, height: Int(40.00));
        holderNameCrd.backgroundColor =  UIColor.white
        holderNameCrd.placeholder = "Account holder name"
        
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
        zipCrd.keyboardType = UIKeyboardType.numberPad
        zipCrd.placeholder = "Zip"
        
        monthCrd.frame = CGRect(x: 40, y: 12, width: a-80, height: Int(40.00));
        monthCrd.backgroundColor =  UIColor.white
        monthCrd .keyboardType = UIKeyboardType.numberPad
        monthCrd.placeholder = "Month"
        
        yearCrd.frame = CGRect(x: 40, y: 12, width: a-80, height: Int(40.00));
        yearCrd.backgroundColor =  UIColor.white
        yearCrd .keyboardType = UIKeyboardType.numberPad
        yearCrd.placeholder = "Year"
        
        cvcCrd.frame = CGRect(x: 40, y: 12, width: a-80, height: Int(40.00));
        cvcCrd.backgroundColor =  UIColor.white
        cvcCrd.isSecureTextEntry = true
        cvcCrd .keyboardType = UIKeyboardType.numberPad
        cvcCrd.placeholder = "Cvc"
        
        doneButton.frame = CGRect(x: 60, y: 15, width:a-120, height: Int(36.00))  //set frame
        doneButton.backgroundColor =  UIColor.blue
        doneButton.setTitleColor(UIColor.white, for: .normal)
        doneButton.setTitle("DONE", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonTap), for: .touchUpInside)
        if (checkFlag == 2)
        {
            let creditCardNumb = UserDefaults.standard
            let creditCardNumKeyValue = creditCardNumb.string(forKey: "creditCardNumKey")
            creditCardNum.text = creditCardNumKeyValue
            
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
            
            let monthRide = UserDefaults.standard
            let monthRideKeyValue = monthRide.string(forKey: "monthRideKey")
            monthCrd.text = monthRideKeyValue
            
            let yearRide = UserDefaults.standard
            let yearRideKeyValue = yearRide.string(forKey: "yearRideKey")
            yearCrd.text = yearRideKeyValue
            
            let cvcRide = UserDefaults.standard
            let cvcRideKeyValue = cvcRide.string(forKey: "cvcRideKey")
            cvcCrd.text = cvcRideKeyValue
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
        return 11
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
            
            cell.addSubview(monthCrd)
        }

        else if(indexPath.row == 8)
        {
            
            cell.addSubview(yearCrd)
        }

        else if(indexPath.row == 9)
        {
            
            cell.addSubview(cvcCrd)
        }

        else if(indexPath.row == 10)
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
        if(creditCardNum.text == "")
        {
            creditCardNum.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Credit card number")
        }
        else if(holderNameCrd.text == "")
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
        else if(monthCrd.text == "")
        {
            monthCrd.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Month")
        }
        else if(yearCrd.text == "")
        {
            yearCrd.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Year")
        }
        else if(cvcCrd.text == "")
        {
            cvcCrd.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Cvc")
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
   
    
    let creditCard = UserDefaults.standard
    creditCard.set(creditCardNum.text!, forKey: "creditCardNumKey")
    
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
    
    let monthC = UserDefaults.standard
    monthC.set(monthCrd.text!, forKey: "monthRideKey")
    
    let yearC = UserDefaults.standard
    yearC.set(yearCrd.text!, forKey: "yearRideKey")
    
    let cvcC = UserDefaults.standard
    cvcC.set(cvcCrd.text!, forKey: "cvcRideKey")
        
    let riderRegViewController = self.storyboard?.instantiateViewController(withIdentifier: "newRiderRegView") as! riderRegisterTableViewController
    riderRegViewController.myStringValue = 2
    self.navigationController?.pushViewController(riderRegViewController, animated: true)
   
    }
    
   /* @IBAction func donate(_ sender: AnyObject) {
        // Initiate the card
        var stripCard = STPCard()
        
        // Split the expiration date to extract Month & Year
        if self.yearCrd.text?.isEmpty == false {
            
            let expMonth = Int(monthCrd.text!)
            let expYear = Int(yearCrd.text!)
            
            // Send the card info to Strip to get the token
            stripCard.number    = self.creditCardNum.text
            stripCard.cvc       = self.cvcCrd.text
            stripCard.expMonth  = UInt(expMonth!)
            stripCard.expYear   = UInt(expYear!)
        }
        
        var underlyingError: NSError?
        stripCard.validateCardReturningError(&underlyingError)
        if underlyingError != nil {
            self.spinner.stopAnimating()
            self.handleError(underlyingError!)
            return
        }
        
        STPAPIClient.shared().createToken(with: stripCard, completion: { (token, error) -> Void in
            
            if error != nil {
                self.handleError(error! as NSError)
                return
            }
            
            self.postStripeToken(token!)
        })
    }*/

 
  
}
