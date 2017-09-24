//
//  CacheShopsInteractorProtocol.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 22/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation
import CoreData

protocol CacheShopsInteractorProtocol {
    
    func execute(shops: Shops,
                 context: NSManagedObjectContext,
                 onSuccess: (Shops) -> Void,
                 onError: (() -> Void)?)
    
    func execute(shops: Shops,
                 context: NSManagedObjectContext,
                 onSuccess: (Shops) -> Void)
    
}
