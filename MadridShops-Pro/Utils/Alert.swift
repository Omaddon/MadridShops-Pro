//
//  Alert.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 23/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit


class Alert {
    
    var message: String? = ""
    
    init(message: String) {
        self.message = message
    }
    
    func show() {
        
        let alert = UIAlertController(title: "- Error -",
                                      message: self.message,
                                      preferredStyle: .alert)
        
        
    }
    
}
