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
        // self.shopsMap.setCenter(locations.last.coordinate, animated: true)
    }
    
    
    func loadAnnotation(_ shopCD: ShopCD) {
        let shopLocation = CLLocation(latitude: CLLocationDegrees(shopCD.latitude),
                                    longitude: CLLocationDegrees(shopCD.longitude))
        
        var subtitle: String = ""
        subtitle.openingLanguage(shopCD)
        
        let annotation = AnnotationShop(coordinate: shopLocation.coordinate,
                                        title: shopCD.name,
                                        subtitle: subtitle,
                                        shopCD: shopCD)
        
        self.shopsMap.addAnnotation(annotation)
    }
    
 
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        
        if let shopsCD = shopFetchedResultsController(context: self.context).fetchedObjects {
            for shopCD in shopsCD {
                loadAnnotation(shopCD)
            }
        }
    }

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let pinID = "shopPin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: pinID)
        
        if pinView == nil {
            
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinID)
            pinView?.canShowCallout = true
            
            let shopCD = (annotation as! AnnotationShop).getShopCD()
            
            let image: UIImage
            if let logo = shopCD.logo {
                image = UIImage(data: logo)!
            } else {
                image = #imageLiteral(resourceName: "no_image")
            }
            
            let rigthButton = UIButton(type: .detailDisclosure)
            let leftButton = UIImageView(image: image)
            leftButton.frame.size.height = 44
            leftButton.frame.size.width = 44
            
            pinView?.rightCalloutAccessoryView = rigthButton
            pinView?.leftCalloutAccessoryView = leftButton
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if let annotation = view.annotation as? AnnotationShop {
            let shopCD = annotation.getShopCD()
            performSegue(withIdentifier: "SegueShopDetail", sender: shopCD)
        }
    }
    
}

















