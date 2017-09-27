//
//  AppDelegate.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var shopContext: NSManagedObjectContext?
    var activityContext: NSManagedObjectContext?
    var coreDataStack = CoreDataStack()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.shopContext = coreDataStack.createContainer(dbName: "MadridShopsPro").viewContext
        self.activityContext = coreDataStack.createContainer(dbName: "MadridShopsPro").viewContext
        
        let nav = self.window?.rootViewController as! UINavigationController
        let menuVC = nav.topViewController as! MenuVC
        menuVC.shopContext = self.shopContext
        menuVC.activityContext = self.activityContext
        
        return true
    }
    

    func applicationDidEnterBackground(_ application: UIApplication) {
        guard let shopContext = self.shopContext,
            let activityContext = self.activityContext  else { return }
        self.coreDataStack.saveContext(context: shopContext)
        self.coreDataStack.saveContext(context: activityContext)
    }

}

