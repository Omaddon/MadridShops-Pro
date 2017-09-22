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
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityView.isHidden = true
        
        self.userInteractor.executeOnce {
            activityView.isHidden = false
            activityView.startAnimating()
            shopsButton.isEnabled = false
            shopsButton.isHidden = true
            activitiesButton.isEnabled = false
            activitiesButton.isHidden = true
            
            initializeData()
        }
        
    }

    
    func initializeData() {
        
        let downloadShopsInteractor: DownloadShopsInteractorProtocol = DownloadShopsInteractorNSURLSession()
        
        downloadShopsInteractor.execute { (shops: Shops) in
            
            let cacheInteractor = CacheShopsInteractorCoreData()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                
                self.userInteractor.executedOnceAlready()
                
                self.activityView.stopAnimating()
                self.activityView.isHidden = true
                
                self.shopsButton.isHidden = false
                self.shopsButton.isEnabled = true
                
                self.activitiesButton.isHidden = false
                self.activitiesButton.isEnabled = true
                
            }, onError: { (error: Error) in
                
            })
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueShops" {
            let vc = segue.destination as! ShopsListVC
            vc.context = self.context
            
        } else if segue.identifier == "SegueActivities" {
            let vc = segue.destination as! ActivityListVC
            vc.context = self.context
        }
    }

}
