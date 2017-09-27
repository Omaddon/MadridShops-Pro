//
//  ActivityListVC+CollectionVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import CoreData


extension ActivityListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - CollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return activityFetchedResultsController(context: self.activityContext).sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activityFetchedResultsController(context: self.activityContext).sections![section].numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCell",
                                                      for: indexPath) as! ActivityCell
        
        let activityCD = activityFetchedResultsController(context: self.activityContext).object(at: indexPath)
        cell.refresh(activityCD: activityCD)
        
        return cell
    }
    
    
    // MARK: - CollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let activityCD = activityFetchedResultsController(context: self.activityContext).object(at: indexPath)
        performSegue(withIdentifier: "SegueActivityDetail", sender: activityCD)
        
    }
    
    
}
