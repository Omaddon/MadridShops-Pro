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
    
    func refresh(shopCD: ShopCD) {
        self.shopNameCell.text = shopCD.name
        
        if deviceLanguage() == DeviceLanguageTypes.Es {
            self.shopHoursCell.text = shopCD.openingHours_es
        } else {
            self.shopHoursCell.text = shopCD.openingHours_en
        }
        
        if let logo = shopCD.logo {
            self.shopImageCell.image = UIImage(data: logo)
        } else {
            self.shopImageCell.image = #imageLiteral(resourceName: "no_image")
        }
        
    }
    
}
