//
//  ActivityListVC+MapKit.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 24/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData


extension ActivityListVC: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // self.shopsMap.setCenter(locations.last.coordinate, animated: true)
    }
    
    
    func loadAnnotation(_ activityCD: ActivityCD) {
        let activityLocation = CLLocation(latitude: CLLocationDegrees(activityCD.latitude),
                                    longitude: CLLocationDegrees(activityCD.longitude))
        
        var subtitle: String = ""
        subtitle.openingLanguage(activityCD)
        
        let annotation = AnnotationActivity(coordinate: activityLocation.coordinate,
                                            title: activityCD.name,
                                            subtitle: subtitle,
                                            activityCD: activityCD)
        
        self.activitiesMap.addAnnotation(annotation)
    }
    
 
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        
        if let activitiesCD = activityFetchedResultsController(context: self.activityContext).fetchedObjects {
            for activityCD in activitiesCD {
                loadAnnotation(activityCD)
            }
        }
    }

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let pinID = "activityPin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: pinID)
        
        if pinView == nil {
            
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinID)
            pinView?.canShowCallout = true
            
            let activityCD = (annotation as! AnnotationActivity).getActivityCD()
            
            let image: UIImage
            if let logo = activityCD.logo {
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
        
        if let annotation = view.annotation as? AnnotationActivity {
            let activityCD = annotation.getActivityCD()
            performSegue(withIdentifier: "SegueActivityDetail", sender: activityCD)
        }
    }
    
}

















