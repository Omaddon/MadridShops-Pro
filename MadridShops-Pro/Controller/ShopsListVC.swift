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
        
        self.shopsCollectionView.dataSource = self
        self.shopsCollectionView.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueShopDetail" {
            let vc = segue.destination as! ShopDetailVC
            vc.shopCD = sender as! ShopCD
        }
    }
    
}
















