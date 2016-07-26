//
//  ViewController.swift
//  Working With Audio
//
//  Created by George Dimitrov on 2016-07-26.
//  Copyright © 2016 SerpentSoftware. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    @IBOutlet var volumeSlider: UISlider!

    @IBAction func play(sender: AnyObject) {
    
        player.play()
    
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    @IBAction func volume(sender: AnyObject) {
        
        player.volume = volumeSlider.value
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = NSBundle.mainBundle().pathForResource("One_Dance_Remix", ofType: "mp3")!
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            
        } catch {
            
            //Process error here
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

