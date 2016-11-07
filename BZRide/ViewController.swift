//
//  ViewController.swift
//  BZRide
//
//  Created by Sooraj on 9/23/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fineCheck(_ sender: AnyObject) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "newDriveBankView") as! driverbankTableViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

}

