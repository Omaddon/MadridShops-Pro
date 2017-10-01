//
//  DataOptions.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 30/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import CoreData


class DataOptions: UIViewController {
    
    var shopContext: NSManagedObjectContext!
    var activityContext: NSManagedObjectContext!
    
    
    @IBOutlet weak var lastUpdate: UILabel!
    @IBOutlet weak var numberOfShops: UILabel!
    @IBOutlet weak var numberOfActivities: UILabel!
    @IBOutlet weak var donwloadDataButton: UIButton!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    @IBOutlet weak var numberOfShopsLabel: UILabel!
    @IBOutlet weak var numberOfActivitiesLabel: UILabel!
    @IBOutlet weak var downloadDataLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title?.setDataTitleCell()
        
        let numberOfShops = shopFetchedResultsController(context: self.shopContext).sections![0].numberOfObjects
        let numberOfActivities = activityFetchedResultsController(context: self.activityContext).sections![0].numberOfObjects
        
        self.numberOfShops.text = String(numberOfShops)
        self.numberOfActivities.text = String(numberOfActivities)
        self.donwloadDataButton.setDownloadDataButtonTitle()
        self.lastUpdateLabel.text?.setLastUpdateLabel()
        self.numberOfShopsLabel.text?.setNumberOfShopsLabel()
        self.numberOfActivitiesLabel.text?.setNumberOfActivities()
        self.downloadDataLabel.text?.setDownloadDataAgainLabel()
        self.adviceLabel.text?.setAdviceDownloadData()
        
        let defaults = UserDefaults.standard
        if let dateLastUptdate = defaults.string(forKey: "lastUpdate") {
            self.lastUpdate.text = dateLastUptdate
        } else {
            self.lastUpdate.text = "-"
        }
        
    }
    
    
    @IBAction func downloadDataAgain(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: "saved")
        defaults.synchronize()
        
        let shopFetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
        let activityFetchRequest: NSFetchRequest<ActivityCD> = ActivityCD.fetchRequest()
        
        do {
            let shopResults = try shopContext.fetch(shopFetchRequest)
            for managedObject in shopResults {
                shopContext.delete(managedObject)
            }
            
            let activityResults = try activityContext.fetch(activityFetchRequest)
            for managedObject in activityResults {
                activityContext.delete(managedObject)
            }
            
            try shopContext.save()
        } catch {
            print("💾💩 Error deleting cache.")
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
}

























