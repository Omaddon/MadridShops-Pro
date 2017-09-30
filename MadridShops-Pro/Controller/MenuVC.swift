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

    var shopContext: NSManagedObjectContext!
    var activityContext: NSManagedObjectContext!
    var userInteractor = UserSettingsInteractor()
    
    @IBOutlet weak var shopsButton: UIButton!
    @IBOutlet weak var activitiesButton: UIButton!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var menuButtonItem: UIBarButtonItem!
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        languageNamesOfButtons()
    }

    
    func languageNamesOfButtons() {
        self.shopsButton.setTitleButtonShops()
        self.activitiesButton.setTitleButtonActivities()
        self.reloadButton.setTitleButtonReload()
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
        menuButtonItem.isEnabled = false
       
        let downloadShopsInteractor: DownloadShopsInteractorProtocol = DownloadShopsInteractorNSURLSession()
        
        let downloadActivitiesInteractor: DownloadActivitiesInteractorProtocol = DownloadActivitiesInteractorNSURLSession()
        
        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            
            let shopCacheInteractor = CacheShopsInteractorCoreData()
            shopCacheInteractor.execute(shops: shops, context: self.shopContext, onSuccess: { (shops: Shops) in

                // Download and caching Shops Success. Now activities...
                downloadActivitiesInteractor.execute(onSuccess: { (activities: Activities) in
                    
                    let activityCacheInteractor = CacheActivitiesInteractorCoreData()
                    activityCacheInteractor.execute(activities: activities, context: self.activityContext, onSuccess: { (activities: Activities) in
                        
                        self.userInteractor.executedOnceAlready()
                        
                        self.activityView.stopAnimating()
                        self.activityView.isHidden = true
                        
                        self.shopsButton.isHidden = false
                        self.shopsButton.isEnabled = true
                        
                        self.activitiesButton.isHidden = false
                        self.activitiesButton.isEnabled = true
                        
                        self.menuButtonItem.isEnabled = true
                        
                    }, onError: {

                        // Activity cache error
                        self.showModalCacheError {
                            self.prepareReloadView()
                        }
                    })
                    
                }, onError: { (error: String) in
                    
                    // Activity download error
                    if error == "parseError" {
                        self.showModalParseError {
                            self.prepareReloadView()
                        }
                    } else {    // urlError + conexionError
                        self.showModalConexionError {
                            self.prepareReloadView()
                        }
                    }
                })
                
            }, onError: {
                
                // Shop cache error
                self.showModalCacheError {
                    self.prepareReloadView()
                }
            })
            
        }, onError: { (error: String) in
            
            // Shop download error
            if error == "parseError" {
                self.showModalParseError {
                    self.prepareReloadView()
                }
            } else {    // urlError + conexionError
                self.showModalConexionError {
                    self.prepareReloadView()
                }
            }
        })
    }
    
    
    @IBAction func reloadData(_ sender: Any) {
        self.userInteractor.executeOnce {
            initializeData()
        }
    }
    
    
    func prepareReloadView() {
        self.activityView.stopAnimating()
        self.activityView.isHidden = true
        self.reloadButton.isHidden = false
        self.reloadButton.isEnabled = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueShops" {
            let vc = segue.destination as! ShopsListVC
            vc.shopContext = self.shopContext
            vc.title?.setShopTitleLanguage()
            
        } else if segue.identifier == "SegueActivities" {
            let vc = segue.destination as! ActivityListVC
            vc.activityContext = self.activityContext
            vc.title?.setActivitiesTitleLanguage()
        }
    }

}
