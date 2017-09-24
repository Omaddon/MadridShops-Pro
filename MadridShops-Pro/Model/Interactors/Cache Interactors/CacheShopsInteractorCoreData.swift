//
//  CacheShopsInteractorCoreData.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 22/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation
import CoreData

class CacheShopsInteractorCoreData: CacheShopsInteractorProtocol {
    
    func execute(shops: Shops,
                 context: NSManagedObjectContext,
                 onSuccess: (Shops) -> Void,
                 onError: (() -> Void)?) {
        
        for i in 0 ..< shops.count() {
            let shop = shops.get(index: i)
            
            let _ = mapShopIntoShopCD(context: context, shop: shop)
        }
        
        do {
            try context.save()
            onSuccess(shops)
        } catch  {
            
            if let myError = onError {
                myError()
            }
            
        }
        
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: (Shops) -> Void) {
        self.execute(shops: shops,
                     context: context,
                     onSuccess: onSuccess,
                     onError: nil)
    }
    
    
}
