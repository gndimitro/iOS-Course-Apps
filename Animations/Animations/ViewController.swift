//
//  ViewController.swift
//  Animations
//
//  Created by George Dimitrov on 2016-06-01.
//  Copyright © 2016 SerpentSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var frame = 2

    var timer = NSTimer()
    
    var isAnimating = true
    
    @IBOutlet var alienImage: UIImageView!
    
    @IBAction func updateImage(sender: AnyObject) {
        
        if isAnimating == true {
            timer.invalidate()
            
            isAnimating = false;
        }
        else {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.doAnimation), userInfo: nil, repeats: true)
            
            isAnimating = true;
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.doAnimation), userInfo: nil, repeats: true)
        
    }
    
    func doAnimation() {
        
        if (frame > 5) {
            frame = 1
        }
        
        alienImage.image = UIImage(named: "frame\(frame).png")
        
        frame += 1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    override func viewDidLayoutSubviews() {
        
        //alienImage.center = CGPointMake(alienImage.center.x - 400, alienImage.center.y)
        //alienImage.alpha = 0
        alienImage.frame = CGRectMake(100, 20, 0, 0)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1) { 
            //self.alienImage.center = CGPointMake(self.alienImage.center.x + 400, self.alienImage.center.y)
            //self.alienImage.alpha = 1
            self.alienImage.frame = CGRectMake(100, 20, 100, 200)
        }
    }*/
    

}

