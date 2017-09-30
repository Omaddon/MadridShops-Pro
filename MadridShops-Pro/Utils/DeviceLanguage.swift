//
//  DeviceLanguage.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 25/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation


public enum DeviceLanguageTypes {
    case en, es
}



func deviceLanguage() -> DeviceLanguageTypes {
    let defaults = UserDefaults.standard
    let language = defaults.string(forKey: "language")
    
    switch language {
    case "es"?:
        return DeviceLanguageTypes.es
    case "en"?:
        return DeviceLanguageTypes.en
    default:
        return giveMeLanguageTypeFrom(Locale.current.languageCode)
    }
}


func languagesList(_ language: DeviceLanguageTypes?) -> [String] {
    switch language {
    case .en?:
        return ["Spanish", "English"]
    case .es?:
        return ["Español", "Inglés"]
    default:
        return ["Español", "Inglés"]
    }
}


func languageTypesOption(_ language: String) -> DeviceLanguageTypes {
    switch language {
    case "Spanish", "Español":
        return DeviceLanguageTypes.es
    case "English", "Inglés":
        return DeviceLanguageTypes.en
    default:
        return DeviceLanguageTypes.es
    }
    
}


func giveMeLanguageTypeFrom(_ lan: String?) -> DeviceLanguageTypes {
    switch lan {
    case "en"?:
        return DeviceLanguageTypes.en
    case "es"?:
        return DeviceLanguageTypes.es
    default:
        return DeviceLanguageTypes.es
    }
}


func giveMeStringFromLanguageType(_ type: DeviceLanguageTypes) -> String {
    return String(describing: type)
}









