//
//  ViewController.swift
//  Map Demo
//
//  Created by George Dimitrov on 2016-07-12.
//  Copyright © 2016 SerpentSoftware. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let latitude:CLLocationDegrees = 40.7
        
        let longitude:CLLocationDegrees = -73.9
        
        //Deltas deal with the zoom level of the map
        let latDelta:CLLocationDegrees = 0.01
        
        let lonDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "New York"
        
        annotation.subtitle = "One day I'll go here...."
        
        map.addAnnotation(annotation)
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
    }
    
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        print("Gesture Recognized")
        
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        var newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "New Place"
        
        annotation.subtitle = "One day I'll go here...."
        
        map.addAnnotation(annotation)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        var userLocation: CLLocation = locations[0] as! CLLocation
        
        var latitude = userLocation.coordinate.latitude
        
        var longitude = userLocation.coordinate.longitude
        
        //Deltas deal with the zoom level of the map
        let latDelta:CLLocationDegrees = 0.01
        
        let lonDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: true)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

