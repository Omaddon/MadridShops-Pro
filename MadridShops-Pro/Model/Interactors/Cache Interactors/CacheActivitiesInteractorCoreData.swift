//
//  CacheActivitiesInteractorCoreData.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 22/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation
import CoreData

class CacheActivitiesInteractorCoreData: CacheActivitiesInteractorProtocol {
    
    func execute(activities: Activities,
                 context: NSManagedObjectContext,
                 onSuccess: (Activities) -> Void,
                 onError: (() -> Void)?) {
        
        for i in 0 ..< activities.count() {
            let activity = activities.get(index: i)
            
            let _ = mapActivityIntoActivityCD(context: context, activity: activity)
        }
        
        do {
            try context.save()
            onSuccess(activities)
        } catch  {
            
            if let myError = onError {
                myError()
            }
            
        }
        
    }
    
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: (Activities) -> Void) {
        self.execute(activities: activities,
                     context: context,
                     onSuccess: onSuccess,
                     onError: nil)
    }
    
    
}
