//
//  Activity.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation


public class Activity {
    var name:           String
    var description_en: String = ""
    var description_es: String = ""
    var latitude:       Float? = nil
    var longitude:      Float? = nil
    var image:          String = ""
    var logo:           String = ""
    var openingHours:   String = ""
    var address:        String = ""
    var email:          String = ""
    var url:            String = ""
    var telephone:      String = ""
    
    public init(name: String) {
        self.name = name
    }
}
