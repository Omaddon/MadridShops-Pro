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
    
    var context: NSManagedObjectContext!
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var shopsMap: MKMapView!
    @IBOutlet weak var shopsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()        
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.locationManager.delegate = self
        self.shopsMap.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.shopsMap.showsUserLocation = true
        
        let madridLocationInitial = CLLocation(latitude: 40.41889, longitude: -3.69194)
        let madridRegion = MKCoordinateRegion(center: madridLocationInitial.coordinate, span: 
            MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        
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
    
}
















