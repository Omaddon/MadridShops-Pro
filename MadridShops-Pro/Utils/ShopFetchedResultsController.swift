//
//  ShopFetchedResultsController.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 22/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation
import CoreData

// MARK: - Fetched results controller

public var _shopfetchedResultsController: NSFetchedResultsController<ShopCD>? = nil

public func shopFetchedResultsController(context: NSManagedObjectContext) -> NSFetchedResultsController<ShopCD> {
    
    if _shopfetchedResultsController != nil {
        return _shopfetchedResultsController!
    }
    
    let fetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
    
    // Set the batch size to a suitable number.
    fetchRequest.fetchBatchSize = 20
    
    // Edit the sort key as appropriate.
    let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
    
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    // fetchRequest == SELECT * FROM EVENT ORDER BY TIMESTAMP DESC
    _shopfetchedResultsController =
        NSFetchedResultsController(fetchRequest: fetchRequest,
                                   managedObjectContext: context,
                                   sectionNameKeyPath: nil,
                                   cacheName: "ShopCacheFile")
    // _fetchedResultsController = self
    
    do {
        try _shopfetchedResultsController!.performFetch()
    } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
    
    return _shopfetchedResultsController!
}
