//
//  ActivityListVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ActivityListVC: UIViewController {
    
    var activityContext: NSManagedObjectContext!
    let locationManager = CLLocationManager()
    
    var showUser: Bool = false
    
    @IBOutlet weak var activitiesMap: MKMapView!
    @IBOutlet weak var activitiesCollectionView: UICollectionView!
    @IBOutlet weak var showUserLocButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.activitiesMap.delegate = self
        
        let madridLocationInitial = CLLocation(latitude: 40.427319, longitude: -3.6932110000000193)
        let madridRegion = MKCoordinateRegion(center: madridLocationInitial.coordinate, span:
            MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        self.activitiesMap.setRegion(madridRegion, animated: true)
        
        self.activitiesCollectionView.dataSource = self
        self.activitiesCollectionView.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueActivityDetail" {
            let vc = segue.destination as! ActivityDetailVC
            vc.activityCD = sender as! ActivityCD
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.locationManager.stopUpdatingHeading()
        self.locationManager.stopUpdatingLocation()
    }
    
    
    @IBAction func showUserLoc(_ sender: UIButton) {
        self.showUser = !self.showUser
        
        if self.showUser {
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.activitiesMap.showsUserLocation = true
            sender.isSelected = true
        } else {
            self.locationManager.stopUpdatingLocation()
            self.activitiesMap.showsUserLocation = false
            sender.isSelected = false
        }
    }
    
}

