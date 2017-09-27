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
    
    let language = Locale.current.languageCode
    
    switch language {
    case "en"?:
        return DeviceLanguageTypes.En
    case "es"?:
        return DeviceLanguageTypes.Es
    default:
        return DeviceLanguageTypes.Es
    }
}
