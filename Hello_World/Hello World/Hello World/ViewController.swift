//
//  ViewController.swift
//  Hello World
//
//  Created by George Dimitrov on 2016-05-03.
//  Copyright © 2016 SerpentSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        
        print("Button tapped!")
        
        label.text = textField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Hello George!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

