//
//  ViewController.swift
//  Where Am I
//
//  Created by George Dimitrov on 2016-07-12.
//  Copyright © 2016 SerpentSoftware. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var altitudeLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    
    var manager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        var userLocation:CLLocation = locations[0]
        
        self.latitudeLabel.text = "\(userLocation.coordinate.latitude)"
        self.longitudeLabel.text = "\(userLocation.coordinate.longitude)"
        
        self.courseLabel.text = "\(userLocation.course)"
        self.speedLabel.text = "\(userLocation.speed)"
        
        self.altitudeLabel.text = "\(userLocation.altitude)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            
            if(error != nil) {
                print(error)
            } else {
                if let p = placemarks?[0] {
                    
                    var subThoroughFare:String = ""
                    
                    if(p.subThoroughfare != nil) {
                        subThoroughFare = p.subThoroughfare!
                    }
                    
                    self.addressLabel.text = "\(subThoroughFare) \(p.thoroughfare!) \n \(p.subLocality!) \n \(p.subAdministrativeArea!) \n \(p.postalCode!) \n \(p.country!)"
                }
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

