//
//  ViewController.swift
//  Is It Prime
//
//  Created by George Dimitrov on 2016-05-05.
//  Copyright © 2016 SerpentSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var numberTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func isItPrime(sender: AnyObject) {
        
        if let numberVal = Int(numberTextField.text!) {
        
            var isPrime = true
            
            if numberVal == 1 {
                isPrime = false
            }
            
            if(numberVal>2) {
                for i in 2 ..< numberVal {
                    if numberVal % i == 0 {
                        isPrime = false;
                    }
                }
            }
            
            if(isPrime) {
                resultLabel.text = "\(numberVal) is prime!"
            }
            else {
                resultLabel.text = "\(numberVal) is not prime!"
            }
        }
        else {
            resultLabel.text = "Please enter a whole number"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.numberTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}

