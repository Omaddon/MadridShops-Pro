//
//  UserSettingsInteractor.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 22/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation

public enum DeviceLanguageTypes {
    case En, Es
}

protocol UserSettingsInteractorProtocol {
    func executeOnce(closure: () -> Void)
    func executedOnceAlready()
    func deviceLanguage() -> DeviceLanguageTypes
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
    
    func deviceLanguage() -> DeviceLanguageTypes {
        return DeviceLanguageTypes.Es
    }
    
    
    
}