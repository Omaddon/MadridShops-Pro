//
//  UserSettingsInteractor.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 22/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation


protocol UserSettingsInteractorProtocol {
    func executeOnce(closure: () -> Void)
    func executedOnceAlready()
    func setUserLanguage(language: DeviceLanguageTypes?)
}


class UserSettingsInteractor: UserSettingsInteractorProtocol {
    
    func executeOnce(closure: () -> Void) {
        let defaults = UserDefaults.standard
        
        if !defaults.bool(forKey: "saved") {
            closure()
        }
    }
    
    func executedOnceAlready() {
        let defaults = UserDefaults.standard
        
        let dateSaved = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_ES")
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        let dateString = formatter.string(from: dateSaved)
        
        defaults.set(dateString, forKey: "lastUpdate")
        defaults.set(true, forKey: "saved")
        
        defaults.synchronize()
    }
    
    
    func setUserLanguage(language: DeviceLanguageTypes?) {
        let defaults = UserDefaults.standard
        var lan = "es"
        
        if language != nil {
            lan = giveMeStringFromLanguageType(language!)
            defaults.set(lan, forKey: "language")
        } else {
            defaults.set(lan, forKey: "language")
        }
        
        defaults.synchronize()
    }
    
    
}















