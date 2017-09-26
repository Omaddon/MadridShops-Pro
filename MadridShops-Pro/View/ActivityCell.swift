//
//  ActivityCell.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit


class ActivityCell: UICollectionViewCell {
    
    @IBOutlet weak var activityNameCell: UILabel!
    @IBOutlet weak var activityHoursCell: UILabel!
    @IBOutlet weak var activityImageCell: UIImageView!
    
    
    func refresh(activityCD: ActivityCD) {
        self.activityNameCell.text = activityCD.name
        
        self.activityHoursCell.text?.openingLanguage(activityCD)
        
        if let logo = activityCD.logo {
            self.activityImageCell.image = UIImage(data: logo)
        } else {
            self.activityImageCell.image = #imageLiteral(resourceName: "no_image")
        }
        
    }
    
}
