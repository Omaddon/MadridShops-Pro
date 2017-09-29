//
//  String+Language.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 25/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit


extension String {
    
    mutating func openingLanguage(_ shopCD: ShopCD) {
        if deviceLanguage() == DeviceLanguageTypes.Es {
            self = shopCD.openingHours_es ?? ""
        } else {
            self = shopCD.openingHours_en ?? ""
        }
    }
    
    
    mutating func openingLanguage(_ activityCD: ActivityCD) {
        if deviceLanguage() == DeviceLanguageTypes.Es {
            self = activityCD.openingHours_es ?? ""
        } else {
            self = activityCD.openingHours_en ?? ""
        }
    }

    
    mutating func descriptionLanguage(_ shopCD: ShopCD) {
        if deviceLanguage() == DeviceLanguageTypes.Es {
            self = shopCD.description_es ?? ""
        } else {
            self = shopCD.description_en ?? ""
        }
    }
    
    
    mutating func descriptionLanguage(_ activityCD: ActivityCD) {
        if deviceLanguage() == DeviceLanguageTypes.Es {
            self = activityCD.description_es ?? ""
        } else {
            self = activityCD.description_en ?? ""
        }
    }
    
    
    mutating func setShopTitleLanguage() {
        if deviceLanguage() == DeviceLanguageTypes.Es {
            self = "Tiendas"
        } else {
            self = "Shops"
        }
    }
    
    
    mutating func setActivitiesTitleLanguage() {
        if deviceLanguage() == DeviceLanguageTypes.Es {
            self = "Actividades"
        } else {
            self = "Activities"
        }
    }
    
    mutating func setOptionsTitleLanguage() {
        if deviceLanguage() == DeviceLanguageTypes.Es {
            self = "Opciones"
        } else {
            self = "Options"
        }
    }
    
    mutating func setTitleLaguangeCell() {
        if deviceLanguage() == DeviceLanguageTypes.Es {
            self = "Idioma"
        } else {
            self = "Language"
        }
    }
    
}


extension UIButton {
    
    func setTitleButtonShops() {
        if deviceLanguage() == DeviceLanguageTypes.Es {
            self.setTitle("Tiendas", for: UIControlState.normal)
        } else {
            self.setTitle("Shops", for: UIControlState.normal)
        }
    }
    
    
    func setTitleButtonActivities() {
        if deviceLanguage() == DeviceLanguageTypes.Es {
            self.setTitle("Actividades", for: UIControlState.normal)
        } else {
            self.setTitle("Activities", for: UIControlState.normal)
        }
    }
    
    
    func setTitleButtonReload() {
        if deviceLanguage() == DeviceLanguageTypes.Es {
            self.setTitle("Recargar", for: UIControlState.normal)
        } else {
            self.setTitle("Reload", for: UIControlState.normal)
        }
    }
}


extension UIViewController {
    func showModalConexionError(onCompletion: @escaping () -> Void) {
        
        var title: String = ""
        var message: String = ""
        
        if deviceLanguage() == DeviceLanguageTypes.Es {
            title = "Error de conexión"
            message = "Imposible conectarse a internet."
            
        } else {
            title = "Conexion error"
            message = "Unable to connect to internet."
        }
        
        showErrorModal(title: title, message: message, vc: self, onCompletion: onCompletion)
    }
    
    
     func showModalCacheError(onCompletion: @escaping () -> Void) {
        var title: String = ""
        var message: String = ""
        
        if deviceLanguage() == DeviceLanguageTypes.Es {
            title = "Error guardando los datos"
            message = "Un error ha ocurrido durante el guardado de los datos del servidor."
            
        } else {
            title = "Error saving data"
            message = "An error happened during caching data from server."
        }
        
        showErrorModal(title: title, message: message, vc: self, onCompletion: onCompletion)
    }
    
    
    func showModalParseError(onCompletion: @escaping () -> Void) {
        
        var title: String = ""
        var message: String = ""
        
        if deviceLanguage() == DeviceLanguageTypes.Es {
            title = "Error en los datos"
            message = "Los datos descargados están corruptos."
            
        } else {
            title = "Data error"
            message = "Downloaded data is corrupt."
        }
        
        showErrorModal(title: title, message: message, vc: self, onCompletion: onCompletion)
    }
    
}


func showErrorModal(title: String,
                    message: String,
                    vc: UIViewController,
                    onCompletion: @escaping () -> Void) {
    
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Ok",
                                  style: UIAlertActionStyle.default,
                                  handler: nil))
    
    vc.present(alert, animated: true, completion: {
        onCompletion()
    })
    
}













    
    
    
    
    
    
    
    
    
    

