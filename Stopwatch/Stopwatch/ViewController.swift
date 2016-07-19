//
//  ViewController.swift
//  Stopwatch
//
//  Created by George Dimitrov on 2016-05-05.
//  Copyright © 2016 SerpentSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer();
    
    var time = 0;
    
    @IBOutlet var timerLabel: UILabel!
    
    func increaseTimer() {
        time += 1
        
        timerLabel.text = String(time)
    }
    
    @IBAction func play(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("increaseTimer"), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        timer.invalidate()
    }

    @IBAction func stop(sender: AnyObject) {
        
        timer.invalidate()
        
        time = 0;
        timerLabel.text = "0"
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

