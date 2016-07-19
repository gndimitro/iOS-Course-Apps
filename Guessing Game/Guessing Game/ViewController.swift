//
//  ViewController.swift
//  Guessing Game
//
//  Created by George Dimitrov on 2016-05-05.
//  Copyright © 2016 SerpentSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userGuessTextField: UITextField!

    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func guess(sender: AnyObject) {
        
        let guessValue = String(arc4random_uniform(6))
        
        if guessValue == userGuessTextField.text {
            resultLabel.text = "You're right!"
        }
        else {
            resultLabel.text = "Wrong! It was a " + guessValue
        }
        
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

