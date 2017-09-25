//
//  ShopsListVC+MapKit.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 24/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData


extension ShopsListVC: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // self.shopsMap.setCenter(locations[0].coordinate, animated: true)
    }
    
    
    func loadAnnotation(_ shopCD: ShopCD) {
        let shopLocation = CLLocation(latitude: CLLocationDegrees(shopCD.latitude),
                                    longitude: CLLocationDegrees(shopCD.longitude))
        
        var subtitle: String = ""
        subtitle.openingLanguage(shopCD)
        
        let annotation = Annotation(coordinate: shopLocation.coordinate,
                                    title: shopCD.name,
                                    subtitle: subtitle)
        
        self.shopsMap.addAnnotation(annotation)
    }
    
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        
        if let shopsCD = shopFetchedResultsController(context: self.context).fetchedObjects {
            for shopCD in shopsCD {
                loadAnnotation(shopCD)
            }
        }
    }
    
}
