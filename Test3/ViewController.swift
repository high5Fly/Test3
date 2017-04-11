//
//  ViewController.swift
//  Test3
//
//  Created by Miroslav Danazhiev on 4/11/17.
//  Copyright © 2017 Miroslav Danazhiev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ZoiperVoip.sharedInstance().setupSIP();
        ZoiperVoip.sharedInstance().registerSIP(
            withUser: "114466", pass: "ce12da08da0dakZX", server: "www.voiptigersip.com", proxy: "<proxy>")
        ZoiperVoip.sharedInstance().activationRegister("", password: "")
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.ctxRegistrationSucceeded(_:)), name: NSNotification.Name(rawValue: "ZSDKctxDidRegistrationSucceeded"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.ctxActivationStatusUpdated(_:)), name: NSNotification.Name(rawValue: "ZSDKctxDidActivationStatusUpdated"), object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func ctxRegistrationSucceeded(_ notification:Notification) {
        print("Register User OK")
    }
    
    func ctxActivationStatusUpdated(_ notification:Notification) {
        print("Activation OK")
    }


}

