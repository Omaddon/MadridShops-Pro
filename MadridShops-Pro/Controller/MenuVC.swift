//
//  MenuVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 22/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import CoreData


class MenuVC: UIViewController {

    var context: NSManagedObjectContext?
    
    @IBOutlet weak var shopsButton: UIButton!
    @IBOutlet weak var activitiesButton: UIButton!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueShops" {
            let vc = segue.destination as! ShopsListVC
            vc.context = self.context
            
        } else if segue.identifier == "SegueActivities" {
            let vc = segue.destination as! ActivityListVC
            vc.context = self.context
        }
    }

}
