//
//  ActivityDetailVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

class ActivityDetailVC: UIViewController {

    var activityCD: ActivityCD!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var activityDescription: UITextView!
    @IBOutlet weak var activitySite: UILabel!
    @IBOutlet weak var activityEmail: UILabel!
    @IBOutlet weak var activityHours: UILabel!
    @IBOutlet weak var activityTelephone: UILabel!
    @IBOutlet weak var activityAddress: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.activityCD.name
        
        refreshData()
    }
    
    
    func refreshData() {
        
        if let data = activityCD.image {
            self.imageView.image = UIImage(data: data)
        } else {
            self.imageView.image = #imageLiteral(resourceName: "no_image")
        }
        
        if let data = activityCD.mapImage {
            self.mapImage.image = UIImage(data: data)
        } else {
            self.mapImage.image = #imageLiteral(resourceName: "no_image")
        }
        
        activitySite.text = activityCD.url
        activityEmail.text = activityCD.email
        activityTelephone.text = activityCD.telephone
        activityAddress.text = activityCD.address
        activityHours.text?.openingLanguage(activityCD)
        activityDescription.text.descriptionLanguage(activityCD)
    }

}
