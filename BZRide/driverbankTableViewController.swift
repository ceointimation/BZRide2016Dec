//
//  driverbankTableViewController.swift
//  BZRide
//
//  Created by Sooraj on 11/7/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class driverbankTableViewController: UITableViewController {
    
    var myStringValue:String?

    @IBOutlet var bankName: UITextField!
    @IBOutlet var accNumber: UITextField!
    @IBOutlet var accHolderName: UITextField!
    @IBOutlet var routeNumber: UITextField!
   
    @IBOutlet var doneBank: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor=UIColor.red
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
        self.tableView.addGestureRecognizer(tapGesture1)
       
    }
    func tapBlurButton(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        //print("Please Help!")
    }

    // validations
    
   func displayAlert(messageToDisplay:String){
        let alertController = UIAlertController(title:"",message:messageToDisplay,preferredStyle:.alert)
        
        let OkAction = UIAlertAction(title:"OK", style:.default)
        alertController.addAction(OkAction)
        self.present(alertController,animated:true,completion:nil)
    }
    func validateRoute(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }

    
    @IBAction func doneBankTapped(_ sender: AnyObject) {
        print("The value of myStringValue is: \(myStringValue!)")
        if bankName.text == "" || accNumber.text == "" || accHolderName.text == ""  || routeNumber.text == ""
        {
           displayAlert(messageToDisplay: "Please fill Bank Details")
           bankName.becomeFirstResponder()
        }
        else
        {
            let provideRoute = routeNumber.text
            let isRouteValid = validateRoute(value:provideRoute!)
            if isRouteValid != true{
                
                displayAlert(messageToDisplay: "Incorrect Routing Number")
                routeNumber.becomeFirstResponder()
            }
            else{
                
                SVProgressHUD.show(withStatus: "Registering Bank Details")
                
                var retData = "driverID="+myStringValue!
                retData += "&AccountType=individual"
                retData += "&BankName="+bankName.text!
                retData += "&accountholdername="+accHolderName.text!
                retData += "&routingnumber="+routeNumber.text!
                retData += "&accountnumber="+accNumber.text!
                
                let postString=retData
                
                var request = URLRequest(url: URL(string: "http://bzride.com/bzride/UpdateInitialBankInfo.php")!)
                request.httpMethod = "POST"
                
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
                        
                        if(status == "S")
                        {
                            SVProgressHUD.dismiss()
                            let myAlert = UIAlertView()
                            myAlert.message = "Bank Registered Successfully"
                            myAlert.addButton(withTitle: "Ok")
                            myAlert.delegate = self
                            myAlert.show()
                            let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "firstView") as! ViewController
                            self.navigationController?.pushViewController(firstViewController, animated: true)
                            

                        }
                         else if(status == "F")
                        {
                            let myAlert = UIAlertView()
                            myAlert.message = "Invalid Routing Number"
                            myAlert.addButton(withTitle: "Ok")
                            myAlert.delegate = self
                            myAlert.show()
                        }
                        else{
                           // SVProgressHUD.dismiss()
                            let myAlert = UIAlertView()
                            myAlert.message = "Bank Registration Failed"
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
        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   /* override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
