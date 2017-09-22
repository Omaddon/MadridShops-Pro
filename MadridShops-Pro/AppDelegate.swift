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
    var context: NSManagedObjectContext?
    var coreDataStack = CoreDataStack()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.context = coreDataStack.createContainer(dbName: "MadridShopsPro").viewContext
        
        let nav = self.window?.rootViewController as! UINavigationController
        let menuVC = nav.topViewController as! MenuVC
        menuVC.context = self.context
        
        return true
    }
    

    func applicationDidEnterBackground(_ application: UIApplication) {
        guard let context = self.context else { return }
        self.coreDataStack.saveContext(context: context)
    }

}

