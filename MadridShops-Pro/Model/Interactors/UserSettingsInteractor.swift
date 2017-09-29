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
        
        defaults.set(true, forKey: "saved")
        defaults.synchronize()
    }
    
    
    func setUserLanguage(language: DeviceLanguageTypes?) {
        let defaults = UserDefaults.standard
        
        if let lan = language {
            defaults.set(lan, forKey: "language")
        } else {
            defaults.set(DeviceLanguageTypes.Es, forKey: "language")
        }
        
        defaults.synchronize()
    }
    
    
}















