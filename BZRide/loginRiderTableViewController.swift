//
//  loginRiderTableViewController.swift
//  BZRide
//
//  Created by Kyeesha Technologies on 1/7/17.
//  Copyright © 2017 Sooraj. All rights reserved.
//

import UIKit

class loginRiderTableViewController: UITableViewController {

    @IBOutlet weak var riderMobile: UITextField!
    @IBOutlet weak var riderPassword: UITextField!
    @IBOutlet weak var loginRiderBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor=UIColor.red
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(loginRiderTableViewController.goBack))
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
    func displayAlert(messageToDisplay:String){
        let alertController = UIAlertController(title:"",message:messageToDisplay,preferredStyle:.alert)
        
        let OkAction = UIAlertAction(title:"OK", style:.default)
        alertController.addAction(OkAction)
        self.present(alertController,animated:true,completion:nil)
    }
    // validate mobile number
    func validateMobile(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    @IBAction func loginRiderTapped(_ sender: AnyObject) {
        if(riderMobile.text == "")
        {
            riderMobile.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Mobile number")
        }
        else if(riderPassword.text == "")
        {
            riderPassword.becomeFirstResponder()
            displayAlert(messageToDisplay: "Please enter Password")
        }
        else
        {
            let provideMobile = riderMobile.text
            let isMobValid = validateMobile(value:provideMobile!)
            if isMobValid != true{
                displayAlert(messageToDisplay: "Incorrect Mobile No")
                riderMobile.becomeFirstResponder()
            }
            else
            {
                 SVProgressHUD.show(withStatus: "Authenticating Rider")
                var retData = "mobilenumber="+riderMobile.text!
                retData += "&password="+riderPassword.text!
                let postString=retData
                
                var request = URLRequest(url: URL(string: "http://bzride.com/bzride/LoginRider.php")!)
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
                        let info = dict["info"]
                        let token = dict["token"]
                        let userid = dict["userid"]
                                             
                        if(status == "S")
                        {
                            SVProgressHUD.dismiss()
                            
                            let firstController = self.storyboard?.instantiateViewController(withIdentifier: "revealnew") as! SWRevealViewController
                            self.navigationController?.pushViewController(firstController, animated: true)
                            
                           
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
