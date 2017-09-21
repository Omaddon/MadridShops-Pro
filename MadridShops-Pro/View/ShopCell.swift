//
//  ShopCell.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit


class ShopCell: UICollectionViewCell {
    
    @IBOutlet weak var shopNameCell: UILabel!
    @IBOutlet weak var shopHoursCell: UILabel!
    @IBOutlet weak var shopImageCell: UIImageView!
    
    func refresh(shop: Shop) {
        self.shopNameCell.text = shop.name
        self.shopHoursCell.text = shop.openingHours_es
        
        shop.logo.loadImageNSURLSession(into: shopImageCell)
    }
    
}
