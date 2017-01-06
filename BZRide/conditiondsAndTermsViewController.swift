//
//  conditiondsAndTermsViewController.swift
//  BZRide
//
//  Created by Kyeesha Technologies on 12/16/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class conditiondsAndTermsViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var htmlWebView: UIWebView!
    
    @IBOutlet var conditionView: UIView!
    override func viewDidLoad() {
        
         htmlWebView.loadRequest(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: "myHtml", ofType: "html")!)))
        
        
        super.viewDidLoad()

          }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let button = UIButton()
        let a=htmlWebView.scrollView.contentSize.height
        button.frame = CGRect(x: 25, y: a-50, width: 111, height: 36)  //set frame
        button.backgroundColor =  UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("ACCEPT", for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        self.htmlWebView.scrollView.addSubview(button)
        
        let btn = UIButton()
        let b = htmlWebView.scrollView.contentSize.height
        let c = htmlWebView.scrollView.contentSize.width
        btn.frame = CGRect(x: c-566, y: b-50, width: 111, height: 36)  //set frame
        btn.setTitle("DECLINE", for: .normal)  //set button title
        btn.setTitleColor(UIColor.white, for: .normal) //set button title color
        btn.backgroundColor = UIColor.blue
        btn.tag = 1 // set button tag
        btn.addTarget(self, action: #selector(declineTappedAction), for: .touchUpInside) //add button action
        self.htmlWebView.scrollView.addSubview(btn)

    }
    @IBAction func acceptButtonTapped(_ sender: AnyObject) {
         SVProgressHUD.show(withStatus: "Registering Driver")
        
        // Driver Reg Values
        let drfName = UserDefaults.standard
        let drfnameKeyValue = drfName.string(forKey: "drFnameKey")
        
        let drMName = UserDefaults.standard
        let drMnameKeyValue = drMName.string(forKey: "drMnameKey")
        
        let drlName = UserDefaults.standard
        let drLnameKeyValue = drlName.string(forKey: "drLnameKey")
        
        let drEmailReg = UserDefaults.standard
        let drMailKeyValue = drEmailReg.string(forKey: "drEmailKey")
        
        let drPassReg = UserDefaults.standard
        let drPassKeyValue = drPassReg.string(forKey: "drPassKey")
        
        let drAdder1Reg = UserDefaults.standard
        let drAdder1KeyValue = drAdder1Reg.string(forKey: "drAdder1Key")
        
        let drAdder2Reg = UserDefaults.standard
        let drAdder2KeyValue = drAdder2Reg.string(forKey: "drAdder2Key")
        
        let drCityRReg = UserDefaults.standard
        let drCityKeyValue = drCityRReg.string(forKey: "drCityRdKey")
        
        let drStateRReg = UserDefaults.standard
        let drStateKeyValue = drStateRReg.string(forKey: "drStateRdKey")
        
        let drPhoneRReg = UserDefaults.standard
        let drPhoneKeyValue = drPhoneRReg.string(forKey: "drPhnKey")
        
        let drZipRReg = UserDefaults.standard
        let drZipKeyValue = drZipRReg.string(forKey: "drZipRdKey")
        
        var Registration="firstName="+drfnameKeyValue!
        
        Registration+="&middleName="+drMnameKeyValue!+"&lastName="+drLnameKeyValue!
        
        Registration=Registration+"&email="+drMailKeyValue!+"&password="+drPassKeyValue!+"&address1="+drAdder1KeyValue!+"&address2="+drAdder2KeyValue!+"&city="+drCityKeyValue!+"&state="+drStateKeyValue!+"&zip="+drZipKeyValue!+"&phone="+drPhoneKeyValue!
        
        Registration=Registration+"&currentlat=aa&currentlong=bb&deviceType=a&devicetoken=1&cardType=d&cardProvider=m&cardBillingAddress1=mattathil&cardBillingAddress2=chotani&cardBillingCity=kochi&cardBillingState=asd&cardBillingZip=9999&cardToken=12&BankName=sss&AccountToken=696"
        
        
        
        // Vehicle details
        
       let drVehicleYear = UserDefaults.standard
        let drVehicleYearKeyValue = drVehicleYear.string(forKey: "drVehicleYearKey")
        
        let drVehicleModel = UserDefaults.standard
        let drVehicleModelKeyValue = drVehicleModel.string(forKey: "drVehicleModelKey")
        
        let drvehicleMake = UserDefaults.standard
        let drvehicleMakeKeyValue = drvehicleMake.string(forKey: "drvehicleMakeKey")
        
        let drvehicleColor = UserDefaults.standard
        let drvehicleColorKeyValue = drvehicleColor.string(forKey: "drvehicleColorKey")
        
        var vehDetails="&vModel="+drVehicleModelKeyValue!
        vehDetails+="&vMake="+drvehicleMakeKeyValue!+"&vColor="+drvehicleColorKeyValue!+"&vYear="+drVehicleYearKeyValue!+"&deviceId=i"
        
        
        // Vehicle Reg Details
        
        let drVehicleNumPlate = UserDefaults.standard
        let drVehicleNumPlateKeyValue = drVehicleNumPlate.string(forKey: "drVehicleNumPlateKey")
        
        let drVehicleState = UserDefaults.standard
        let drVehicleStateKeyValue = drVehicleState.string(forKey: "drVehicleStateKey")
        
        let drVehicleRegDate = UserDefaults.standard
        let drVehicleRegDateKeyValue = drVehicleRegDate.string(forKey: "drVehicleRegDateKey")
        
        
        let drVehicleExpDate = UserDefaults.standard
        let drVehicleExpDateKeyValue = drVehicleExpDate.string(forKey: "drVehicleExpDateKey")
        
        var vehDetails1="&vNumber="+drVehicleNumPlateKeyValue!
        
        vehDetails1+="&vDateRegistered="+drVehicleRegDateKeyValue!+"&vStateRegistered="+drVehicleStateKeyValue!+"&vExpiryDate="+drVehicleExpDateKeyValue!
        
        //Insurance Details
       let drInsuranceCompany = UserDefaults.standard
        let drInsuranceCompanyKeyValue = drInsuranceCompany.string(forKey: "drInsuranceCompanyKey")
        
        let drInsuranceNumber = UserDefaults.standard
        let drInsuranceNumberKeyValue = drInsuranceNumber.string(forKey: "drInsuranceNumberKey")
        
        let drInsuranceRegDate = UserDefaults.standard
        let drInsuranceRegDateKeyValue = drInsuranceRegDate.string(forKey: "drInsuranceRegDateKey")
        
        let drInsuranceExpDate = UserDefaults.standard
        let drInsuranceExpDateValue = drInsuranceExpDate.string(forKey: "drInsuranceExpDateKey")
        
         var vehInsu="&insCompany="+drInsuranceCompanyKeyValue!
        vehInsu+="&insPolicyNumber="+drInsuranceNumberKeyValue!+"&insValidFromDate="+drInsuranceRegDateKeyValue!+"&insExpDate="+drInsuranceExpDateValue!

        // License Details
        
         let drLicenseNumber = UserDefaults.standard
        let drLicenseNumberKeyValue = drLicenseNumber.string(forKey: "drLicenseNumberKey")
        
        let drLicenseStateIssue = UserDefaults.standard
        let drLicenseStateIssueKeyValue = drLicenseStateIssue.string(forKey: "drLicenseStateIssueKey")
        
        let drLicenseIssDate = UserDefaults.standard
        let drLicenseIssDateKeyValue = drLicenseIssDate.string(forKey: "drLicenseIssDateKey")
        
        let drLicenseExpDate = UserDefaults.standard
        let drLicenseExpDateKeyValue = drLicenseExpDate.string(forKey: "drLicenseExpDateKey")
        
         var vehLIC="&licenseNumber="+drLicenseNumberKeyValue!
        vehLIC+="&licenceStateIssued="+drLicenseStateIssueKeyValue!+"&licenseDateIssued="+drLicenseIssDateKeyValue!+"&licenseExpDate="+drLicenseExpDateKeyValue!
        
        let postString=Registration+vehInsu+vehLIC+vehDetails1+vehDetails
        
        // print("postString is ==============\(postString)")
        
       var request = URLRequest(url: URL(string: "http://bzride.com/bzride/RegisterDriver.php")!)
        request.httpMethod = "POST"
        
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
                let id = dict["Id"]
                let info = dict["info"]
                
                if(status == "S")
                {
                    UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)

                    SVProgressHUD.dismiss()
                    let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDriveBankView") as! driverbankTableViewController
                    secondViewController.myStringValue = id
                    self.navigationController?.pushViewController(secondViewController, animated: true)
                }
                else {
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
    @IBAction func declineTappedAction(_ sender: AnyObject) {
        let vehicleViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDriverRegTabView") as! DriverRegisterTableViewController
        vehicleViewController.myStringValue = 2
        self.navigationController?.pushViewController(vehicleViewController, animated: true)
    }

  
}
