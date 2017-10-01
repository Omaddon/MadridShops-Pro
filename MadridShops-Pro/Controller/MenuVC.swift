//
//  MenuVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 22/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import CoreData
import SystemConfiguration


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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        languageNamesOfButtons()
        downloadData()
    }

    
    func languageNamesOfButtons() {
        self.shopsButton.setTitleButtonShops()
        self.activitiesButton.setTitleButtonActivities()
        self.reloadButton.setTitleButtonReload()
    }
    
    
    func initializeData() {
       
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
        downloadData()
    }
    
    
    func downloadData() {
        self.userInteractor.executeOnce {
            prepareButtonsForDownload()
            if isConnectedToNetwork() {
                initializeData()
            } else {
                self.showModalConexionError {
                    self.prepareReloadView()
                }
            }
        }
    }
    
    
    func prepareReloadView() {
        self.activityView.stopAnimating()
        self.activityView.isHidden = true
        self.reloadButton.isHidden = false
        self.reloadButton.isEnabled = true
    }
    
    
    func prepareButtonsForDownload() {
        activityView.isHidden = false
        activityView.startAnimating()
        shopsButton.isEnabled = false
        shopsButton.isHidden = true
        activitiesButton.isEnabled = false
        activitiesButton.isHidden = true
        reloadButton.isHidden = true
        reloadButton.isEnabled = false
        menuButtonItem.isEnabled = false
    }
    
    
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        return (isReachable && !needsConnection)
        
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
            
        } else if segue.identifier == "SegueMenuOptions" {
            let vc = segue.destination as! OptionsVC
            vc.shopContext = self.shopContext
            vc.activityContext = self.activityContext
        }
    }

}





















