//
//  ViewController.swift
//  smartTest
//
//  Created by Swaminarayan on 03/05/23.
//

import UIKit
import SMART

class ViewController: UIViewController {

    let smart = AppDelegate.shared.smart
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        smart.authProperties.embedded = true
        smart.authProperties.granularity = .patientSelectNative
    }

    @IBAction func login(_ sender: UIButton) {
        smart.authorize() { patient, error in
            if let error = error {
                // there was an error
            }
            else {
                print(patient?.name?.first?.human)
                
                // `patient` is a "Patient" resource on success, unless you've used
                // the `TokenOnly` granularity
            }
        }
    }
    

}

