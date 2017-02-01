//
//  riderMapViewController.swift
//  BZRide
//
//  Created by Kyeesha Technologies on 1/25/17.
//  Copyright © 2017 Sooraj. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

var lat:Double?
var lon:Double?

class riderMapViewController: UIViewController {
    @IBOutlet var mapView: GMSMapView!
    @IBOutlet weak var openBtn: UIBarButtonItem!
    @IBOutlet weak var dropSrch: UISearchBar!
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var placesClient: GMSPlacesClient?
    var zoomLevel: Float = 16.0


    override func viewDidLoad() {
        super.viewDidLoad()

        openBtn.target = self.revealViewController()
        openBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placesClient = GMSPlacesClient.shared()
        
        let camera = GMSCameraPosition.camera(withLatitude: 40.750130468168472,
                                              longitude: 14.636466174389051,
                                              zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
        self.mapView.isMyLocationEnabled = true
        self.mapView.settings.myLocationButton = true
        self.mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Add the map to the view, hide it until we've got a location update.
        self.view.addSubview(mapView)
        self.view.bringSubview(toFront: mapView)
        self.mapView.isHidden = true
        dropSrch.isHidden = true
        
        let button = UIButton()
         let a = view.frame.size.height
        button.frame = CGRect(x: 25, y: a-50, width: 150, height: 40)  //set frame
        button.backgroundColor =  UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("REQUEST NOW", for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(rideRequestTapped), for: .touchUpInside)
        self.mapView.addSubview(button)
        
        let btn = UIButton()
        let b = view.frame.size.height
        let c = view.frame.size.width
        btn.frame = CGRect(x: c-180, y: b-50, width: 150, height: 40)  //set frame
        btn.setTitle("SCHEDULE", for: .normal)  //set button title
        btn.setTitleColor(UIColor.white, for: .normal) //set button title color
        btn.backgroundColor = UIColor.blue
        btn.tag = 1 // set button tag
        btn.addTarget(self, action: #selector(scheduleTapped), for: .touchUpInside) //add button action
        self.mapView.addSubview(btn)
        
    }
    
    @IBAction func rideRequestTapped(_ sender: AnyObject) {
        let alertController = UIAlertController(title:"Select Pickup location!",message:"",preferredStyle:.alert)
       /* let automatic = UIAlertAction(title:"Automatically", style:.default)
        let manual = UIAlertAction(title:"Manually", style:.default)
        alertController.addAction(automatic)
        alertController.addAction(manual)*/
        alertController.addAction(UIAlertAction(title: "Automatically", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in self.automatic() }))
        
         alertController.addAction(UIAlertAction(title: "Manually", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in print("you have pressed the Manually button") }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in print("you have pressed the Cancel button") }))
        

        self.present(alertController,animated:true,completion:nil)
    }
    
   
    @IBAction func scheduleTapped(_ sender: AnyObject) {
        print("HAIIIII")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension riderMapViewController: CLLocationManagerDelegate {
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        lat =  location.coordinate.latitude
        lon =  location.coordinate.longitude
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
        
    }
    func automatic()
    {
        print("Latitude: \(lat)")
        print("longitude: \(lon)")
        dropSrch.isHidden = false
    }
}

