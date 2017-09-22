//
//  ShopsListVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class ShopsListVC: UIViewController {
    
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var shopsMap: MKMapView!
    @IBOutlet weak var shopsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initializeData()
        
        
        self.shopsCollectionView.dataSource = self
        self.shopsCollectionView.delegate = self
        
    }
    
    
    func initializeData() {
        
        let downloadShopsInteractor: DownloadShopsInteractorProtocol = DownloadShopsInteractorNSURLSession()
        
        downloadShopsInteractor.execute { (shops: Shops) in
            
            let cacheInteractor = CacheShopsInteractorCoreData()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in

                
                self._fetchedResultsController = nil
                self.shopsCollectionView.delegate = self
                self.shopsCollectionView.dataSource = self
                self.shopsCollectionView.reloadData()
                                        
            }, onError: { (error: Error) in
                
            })
        }
    }
    
    
    // MARK: - Fetched results controller
    
    var _fetchedResultsController: NSFetchedResultsController<ShopCD>? = nil
    
    
    var fetchedResultsController: NSFetchedResultsController<ShopCD> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
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
        _fetchedResultsController =
            NSFetchedResultsController(fetchRequest: fetchRequest,
                                       managedObjectContext: self.context!,
                                       sectionNameKeyPath: nil,
                                       cacheName: "ShopCacheFile")
        // _fetchedResultsController = self
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
}
















