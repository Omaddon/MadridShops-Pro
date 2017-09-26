//
//  CacheActivitiesInteractorProtocol.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 22/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation
import CoreData

protocol CacheActivitiesInteractorProtocol {
    
    func execute(activities: Activities,
                 context: NSManagedObjectContext,
                 onSuccess: (Activities) -> Void,
                 onError: (() -> Void)?)
    
    func execute(activities: Activities,
                 context: NSManagedObjectContext,
                 onSuccess: (Activities) -> Void)
    
}
