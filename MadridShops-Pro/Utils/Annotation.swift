//
//  Annotation.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 24/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    var shopCD: ShopCD
    
    init(coordinate: CLLocationCoordinate2D,
         title: String? = "",
         subtitle: String? = "",
         shopCD: ShopCD) {
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        self.shopCD = shopCD
    }
    
    func getShopCD() -> ShopCD {
        return shopCD
    }
    
}


