//
//  DeviceLanguage.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 25/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation


public enum DeviceLanguageTypes {
    case En, Es
}



func deviceLanguage() -> DeviceLanguageTypes {
    let defaults = UserDefaults.standard
    
    if let language = (defaults.array(forKey: "language")?.last as! DeviceLanguageTypes?) {
        return language
    } else {
        let lan = Locale.current.languageCode
        
        switch lan {
        case "en"?:
            return DeviceLanguageTypes.En
        case "es"?:
            return DeviceLanguageTypes.Es
        default:
            return DeviceLanguageTypes.Es
        }
    }
}


func languagesOptions(_ language: DeviceLanguageTypes?) -> [String] {
    switch language {
    case .En?:
        return ["Spanish", "English"]
    case .Es?:
        return ["Español", "Inglés"]
    default:
        return ["Español", "Inglés"]
    }
}










