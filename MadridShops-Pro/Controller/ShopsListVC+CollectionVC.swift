//
//  ShopsListVC+CollectionVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import CoreData


extension ShopsListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultsController.sections![section].numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell",
                                                      for: indexPath) as! ShopCell
        
        let shopCD = fetchedResultsController.object(at: indexPath)
        cell.refresh(shop: mapShopCDIntoShop(shopCD: shopCD))
        
        return cell
    }
    
    
    // MARK: - CollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
