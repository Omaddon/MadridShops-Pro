//
//  ShopsListVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import MapKit

class ShopsListVC: UIViewController {
    
    var shops = Shops()
    
    @IBOutlet weak var shopsMap: MKMapView!
    @IBOutlet weak var shopsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initializeData()
        
        
        //self.shopsCollectionView.dataSource = self
        //self.shopsCollectionView.delegate = self
        
    }
    
    
    func initializeData() {
        
        let downloadShopsInteractor: DownloadShopsInteractorProtocol = DownloadShopsInteractorNSURLSession()
        
        downloadShopsInteractor.execute { (shops: Shops) in
            self.shops = shops
            self.shopsCollectionView.delegate = self
            self.shopsCollectionView.dataSource = self
            self.shopsCollectionView.reloadData()
        }
        
    }
    
}
















