//
//  ViewController.swift
//  OTP_App
//
//  Created by Daxeel Soni.
//  Copyright (c) 2016 Daxeel Soni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var txtOtp: UITextField!
    @IBOutlet weak var btnVerify: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblError.text = ""
        txtOtp.hidden = true
        btnVerify.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendAction(sender: AnyObject) {
        var phone_no = txtPhone.text
        if phone_no == "" {
            lblError.text = "Invalid phone number"
        } else {
            lblError.text = "Sending otp to " + phone_no + "..."
            
            let url = NSURL(string: "<PERSONAL_OTP_API>/91" + phone_no)
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                var response = NSString(data: data!, encoding: NSUTF8StringEncoding)
                self.lblError.text = response
                
                self.txtOtp.hidden = false
                self.btnVerify.hidden = false
            }
            task.resume()
            
            txtPhone.hidden = true
            btnSend.hidden = true
            
        }
    }
    
    @IBAction func verifyAction(sender: AnyObject) {
        var phone_no = txtPhone.text
        var otp = txtOtp.text
        if otp == "" {
            lblError.text = "Misiong OTP"
        } else {
            lblError.text = "Verifying otp..."
            
            let url = NSURL(string: "<PERSONAL_OTP_API>/91" + phone_no + "/" + otp)
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                var response = NSString(data: data!, encoding: NSUTF8StringEncoding)
                self.lblError.text = response
            }
            task.resume()
            
        }
    }
    

}

