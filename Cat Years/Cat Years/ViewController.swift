//
//  ViewController.swift
//  Cat Years
//
//  Created by George Dimitrov on 2016-05-03.
//  Copyright © 2016 SerpentSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var catAgeTextField: UITextField!

    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func findAge(sender: AnyObject) {
        
        let catAge = Int(catAgeTextField.text!)! * 7
        
        resultLabel.text = "Your cat is: \(catAge) years old"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

