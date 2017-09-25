//
//  ShopDetailVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

class ShopDetailVC: UIViewController {

    var shopCD: ShopCD!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var shopDescription: UITextView!
    @IBOutlet weak var shopSite: UILabel!
    @IBOutlet weak var shopEmail: UILabel!
    @IBOutlet weak var shopHours: UILabel!
    @IBOutlet weak var shopTelephone: UILabel!
    @IBOutlet weak var shopAddress: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.shopCD.name
        
        refreshData()
    }
    
    
    func refreshData() {
        
        if let data = shopCD.image {
            self.imageView.image = UIImage(data: data)
        } else {
            self.imageView.image = #imageLiteral(resourceName: "no_image")
        }
        
        if let data = shopCD.mapImage {
            self.mapImage.image = UIImage(data: data)
        } else {
            self.mapImage.image = #imageLiteral(resourceName: "no_image")
        }
        
        shopSite.text = shopCD.url
        shopEmail.text = shopCD.email
        shopTelephone.text = shopCD.telephone
        shopAddress.text = shopCD.address
        shopHours.text?.openingLanguage(shopCD)
        shopDescription.text.descriptionLanguage(shopCD)        
    }

}
