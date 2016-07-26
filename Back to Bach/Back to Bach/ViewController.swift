//
//  ViewController.swift
//  Back to Bach
//
//  Created by George Dimitrov on 2016-07-26.
//  Copyright © 2016 SerpentSoftware. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    @IBAction func play(sender: AnyObject) {
        
        player.play()
        
    }
    
    @IBOutlet var volumeSlider: UISlider!
    
    @IBAction func adjustVolume(sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    
    @IBOutlet var scrubSlider: UISlider!
    @IBAction func scrub(sender: AnyObject) {
        player.currentTime = NSTimeInterval(scrubSlider.value)
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
    }
    @IBAction func stop(sender: AnyObject) {
        player.stop()
        player.currentTime = 0;
        
    }
    
    func loadAudioIntoPlayer() {
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("One_Dance_Remix", ofType: "mp3")!))
            
            scrubSlider.maximumValue = Float(player.duration)
        } catch {
            //Catch errors here
        }
    }
    
    func updateScrubSlider() {
        scrubSlider.value = Float(player.currentTime)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAudioIntoPlayer()
        _ = NSTimer.scheduledTimerWithTimeInterval(1,target: self, selector: (#selector(ViewController.updateScrubSlider)) ,userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

