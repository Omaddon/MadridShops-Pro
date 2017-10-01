//
//  ShopsListVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ShopsListVC: UIViewController {
    
    var shopContext: NSManagedObjectContext!
    let locationManager = CLLocationManager()
    
    var showUser: Bool = false
    
    @IBOutlet weak var shopsMap: MKMapView!
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    @IBOutlet weak var showUserLocButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.delegate = self
        self.shopsMap.delegate = self
        
        let madridLocationInitial = CLLocation(latitude: 40.427319, longitude: -3.6932110000000193)
        let madridRegion = MKCoordinateRegion(center: madridLocationInitial.coordinate, span: 
            MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        self.shopsMap.setRegion(madridRegion, animated: true)
        
        self.shopsCollectionView.dataSource = self
        self.shopsCollectionView.delegate = self
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueShopDetail" {
            let vc = segue.destination as! ShopDetailVC
            vc.shopCD = sender as! ShopCD
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
            self.shopsMap.showsUserLocation = true
            sender.isSelected = true
        } else {
            self.locationManager.stopUpdatingLocation()
            self.shopsMap.showsUserLocation = false
            sender.isSelected = false
        }
    }
}






















