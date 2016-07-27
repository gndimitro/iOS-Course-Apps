//
//  ViewController.swift
//  Shake Project
//
//  Created by George Dimitrov on 2016-07-26.
//  Copyright © 2016 SerpentSoftware. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    var sounds = ["bean", "belch", "giggle", "pew", "pig", "snore", "static", "uuu"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {
            
            let randomNumber = arc4random_uniform(UInt32(sounds.count))
            
            let fileLocation = NSBundle.mainBundle().pathForResource(sounds[Int(randomNumber)], ofType: "mp3")
            
            do {
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                player.play()
            } catch {
                
                //Catch error here
            
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

