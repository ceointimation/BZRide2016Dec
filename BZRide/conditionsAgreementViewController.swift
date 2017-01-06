//
//  conditionsAgreementViewController.swift
//  BZRide
//
//  Created by Kyeesha Technologies on 1/5/17.
//  Copyright © 2017 Sooraj. All rights reserved.
//

import UIKit

class conditionsAgreementViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webViewHtmlFile: UIWebView!
    @IBOutlet var conditionView: UIView!
    
    override func viewDidLoad() {
        
        webViewHtmlFile.loadRequest(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: "myHtml", ofType: "html")!)))
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let button = UIButton()
        let a=webViewHtmlFile.scrollView.contentSize.height
        button.frame = CGRect(x: 25, y: a-50, width: 111, height: 36)  //set frame
        button.backgroundColor =  UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("ACCEPT", for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        self.webViewHtmlFile.scrollView.addSubview(button)
        
        let btn = UIButton()
        let b = webViewHtmlFile.scrollView.contentSize.height
        let c = webViewHtmlFile.scrollView.contentSize.width
        btn.frame = CGRect(x: c-566, y: b-50, width: 111, height: 36)  //set frame
        btn.setTitle("DECLINE", for: .normal)  //set button title
        btn.setTitleColor(UIColor.white, for: .normal) //set button title color
        btn.backgroundColor = UIColor.blue
        btn.tag = 1 // set button tag
        btn.addTarget(self, action: #selector(declineTappedAction), for: .touchUpInside) //add button action
        self.webViewHtmlFile.scrollView.addSubview(btn)
        
    }
 @IBAction func acceptButtonTapped(_ sender: AnyObject) {
    SVProgressHUD.show(withStatus: "Registering Driver")
  
    let token = UserDefaults.standard.string(forKey: "stptoken")
    
    
    
    let fName = UserDefaults.standard
    let fnameKeyValue = fName.string(forKey: "fnameKey")
    
    let mName = UserDefaults.standard
    let mnameKeyValue = mName.string(forKey: "mnameKey")
    
    let lName = UserDefaults.standard
    let lnameKeyValue = lName.string(forKey: "lnameKey")
    
    let emailReg = UserDefaults.standard
    let mailKey = emailReg.string(forKey: "emailKey")
    
    let passReg = UserDefaults.standard
    let passKeyValue = passReg.string(forKey: "passKey")
    
    let adder1Reg = UserDefaults.standard
    let adder1KeyValue = adder1Reg.string(forKey: "adder1Key")
    
    let adder2Reg = UserDefaults.standard
    let adder2KeyValue = adder2Reg.string(forKey: "adder2Key")
    
    let cityRReg = UserDefaults.standard
    let cityKeyValue = cityRReg.string(forKey: "cityRdKey")
    
    let stateRReg = UserDefaults.standard
    let stateKeyValue = stateRReg.string(forKey: "stateRdKey")
    
    let phoneRReg = UserDefaults.standard
    let phoneKeyValue = phoneRReg.string(forKey: "phnKey")
    
    let zipRReg = UserDefaults.standard
    let zipKeyValue = zipRReg.string(forKey: "zipRdKey")
    
    
    var retData = "firstName="+fnameKeyValue!
    retData += "&middleName="+mnameKeyValue!
    retData += "&lastName="+lnameKeyValue!
    retData += "&email="+mailKey!
    retData += "&password="+passKeyValue!
    retData += "&address1="+adder1KeyValue!
    retData += "&address2="+adder2KeyValue!
    retData += "&city="+cityKeyValue!
    retData += "&state="+stateKeyValue!
    retData += "&zip="+zipKeyValue!
    retData += "&phone="+phoneKeyValue!
    
    // credit card
    let adder1Rid = UserDefaults.standard
    let adder1RidKeyValue = adder1Rid.string(forKey: "add1Key")
    
    let adder2Rid = UserDefaults.standard
    let adder2RidKeyValue = adder2Rid.string(forKey: "add2Key")
    
    let cityRide = UserDefaults.standard
    let cityRideValue = cityRide.string(forKey: "cityKey")
    
    let stateRide = UserDefaults.standard
    let stateRideKeyValue = stateRide.string(forKey: "stateKey")
    
    let zipRide = UserDefaults.standard
    let zipRideKeyValue = zipRide.string(forKey: "zipKey")
    
    let cardTypeRide = UserDefaults.standard
    let zcardTypeRideValue = cardTypeRide.string(forKey: "cardTypeKey")
    
    let cardProviderKeyRide = UserDefaults.standard
    let cardProviderKeyRideValue = cardProviderKeyRide.string(forKey: "cardProviderKey")
    
    retData += "&status=A&deviceId=I&devicetoken=1&deviceType=I&cardType="+zcardTypeRideValue!+"&cardProvider="+cardProviderKeyRideValue!+"&cardBillingAddress1="+adder1RidKeyValue!+"&cardBillingAddress2="+adder2RidKeyValue!+"&cardBillingCity="+cityRideValue!+"&cardBillingState="+stateRideKeyValue!+"&cardBillingZip="+zipRideKeyValue!+"&cardToken="+token!
    
    let postString=retData
    
    var request = URLRequest(url: URL(string: "http://bzride.com/bzride/RegisterRider.php")!)
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
            
            if(status == "S")
            {
                SVProgressHUD.dismiss()
                
                let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "firstView") as! ViewController
                self.navigationController?.pushViewController(firstViewController, animated: true)
                
                
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     @IBAction func declineTappedAction(_ sender: AnyObject) {
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
