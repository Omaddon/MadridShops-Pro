//
//  MenuVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 22/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import CoreData


class MenuVC: UIViewController {

    var context: NSManagedObjectContext!
    var userInteractor = UserSettingsInteractor()
    
    @IBOutlet weak var shopsButton: UIButton!
    @IBOutlet weak var activitiesButton: UIButton!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityView.isHidden = true
        reloadButton.isHidden = true
        reloadButton.isEnabled = false
        
        languageNamesOfButtons()
        
        self.userInteractor.executeOnce {
            initializeData()
        }
    }

    
    func languageNamesOfButtons() {
        
        if deviceLanguage() == DeviceLanguageTypes.Es {
            
            self.shopsButton.setTitle("Tiendas", for: UIControlState.normal)
            self.activitiesButton.setTitle("Actividades", for: UIControlState.normal)
            self.reloadButton.setTitle("Recargar", for: UIControlState.normal)
            
        } else {

            self.shopsButton.setTitle("Shops", for: UIControlState.normal)
            self.activitiesButton.setTitle("Activities", for: UIControlState.normal)
            self.reloadButton.setTitle("Reload", for: UIControlState.normal)
        }
    }
    
    
    func initializeData() {
        
        activityView.isHidden = false
        activityView.startAnimating()
        shopsButton.isEnabled = false
        shopsButton.isHidden = true
        activitiesButton.isEnabled = false
        activitiesButton.isHidden = true
        reloadButton.isHidden = true
        reloadButton.isEnabled = false
       
        let downloadShopsInteractor: DownloadShopsInteractorProtocol = DownloadShopsInteractorNSURLSession()
        
        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            
            let cacheInteractor = CacheShopsInteractorCoreData()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                
                self.userInteractor.executedOnceAlready()
                
                self.activityView.stopAnimating()
                self.activityView.isHidden = true
                
                self.shopsButton.isHidden = false
                self.shopsButton.isEnabled = true
                
                self.activitiesButton.isHidden = false
                self.activitiesButton.isEnabled = true
                
            }, onError: {
                
                var title: String = ""
                var message: String = ""
                
                if deviceLanguage() == DeviceLanguageTypes.Es {
                    title = "Error guardando los datos"
                    message = "Un error ha ocurrido durante el guardado de los datos del servidor."
                } else {
                    title = "Error saving data"
                    message = "An error happened during caching data from server."
                }
                
                self.showError(title: title, message: message)
                
            })
        }, onError: {
            
            var title: String = ""
            var message: String = ""
            
            if deviceLanguage() == DeviceLanguageTypes.Es {
                title = "Error de conexión"
                message = "Imposible conectarse a internet."
                
            } else {
                title = "Conexion error"
                message = "Unable to connect to internet."
            }
            
            self.showError(title: title, message: message)
            
        })
    }
    
    
    @IBAction func reloadData(_ sender: Any) {
        self.userInteractor.executeOnce {
            initializeData()
        }
    }
    
    
    func showError(title: String, message: String) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: UIAlertActionStyle.default,
                                      handler: nil))
        
        self.present(alert, animated: true, completion: {
            self.activityView.stopAnimating()
            self.activityView.isHidden = true
            self.reloadButton.isHidden = false
            self.reloadButton.isEnabled = true
        })
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var language: String = ""
        if deviceLanguage() == DeviceLanguageTypes.Es {
            language = "es"
        } else {
            language = "en"
        }
        
        if segue.identifier == "SegueShops" {
            let vc = segue.destination as! ShopsListVC
            vc.context = self.context
            
            if language == "es" {
                vc.title = "Tiendas"
            } else {
                vc.title = "Shops"
            }
            
        } else if segue.identifier == "SegueActivities" {
            let vc = segue.destination as! ActivityListVC
            vc.context = self.context
            
            if language == "es" {
                vc.title = "Actividades"
            } else {
                vc.title = "Activities"
            }
        }
    }

}
