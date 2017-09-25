//
//  LanguageDevice.swift
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
    
    return language == "en" ? DeviceLanguageTypes.En : DeviceLanguageTypes.Es
}
