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
    
    // MARK: - CollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return shopFetchedResultsController(context: self.shopContext).sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopFetchedResultsController(context: self.shopContext).sections![section].numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell",
                                                      for: indexPath) as! ShopCell
        
        let shopCD = shopFetchedResultsController(context: self.shopContext).object(at: indexPath)
        cell.refresh(shopCD: shopCD)
        
        return cell
    }
    
    
    // MARK: - CollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let shopCD = shopFetchedResultsController(context: self.shopContext).object(at: indexPath)
        performSegue(withIdentifier: "SegueShopDetail", sender: shopCD)
        
    }
    
    
}
