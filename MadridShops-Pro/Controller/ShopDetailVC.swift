//
//  ShopDetailVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

class ShopDetailVC: UIViewController {

    var shop: Shop!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.shop.name
    }

}
