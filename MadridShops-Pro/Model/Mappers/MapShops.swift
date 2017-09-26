//
//  MapShops.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 22/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation
import CoreData


func mapShopIntoShopCD(context: NSManagedObjectContext,
                       shop: Shop) -> ShopCD {
    
    let shopCD = ShopCD(context: context)
    
    shopCD.address          = shop.address
    shopCD.description_en   = shop.description_en
    shopCD.description_es   = shop.description_es
    shopCD.email            = shop.email
    shopCD.imageURL         = shop.image
    shopCD.logoURL          = shop.logo
    shopCD.latitude         = shop.latitude ?? 0.0
    shopCD.longitude        = shop.longitude ?? 0.0
    shopCD.name             = shop.name
    shopCD.openingHours_en  = shop.openingHours_en
    shopCD.openingHours_es  = shop.openingHours_es
    shopCD.telephone        = shop.telephone
    shopCD.url              = shop.url
    
    let serialQueue = DispatchQueue(label: "DownloadImageQueue")
    serialQueue.sync {
        shopCD.logo = downloadAndCacheImage(urlString: shop.logo)
        shopCD.image = downloadAndCacheImage(urlString: shop.image)
        
        let urlString = mapAPI + "\(shop.latitude!),\(shop.longitude!)"
        shopCD.mapImage = downloadAndCacheImage(urlString: urlString)
    }
    
    return shopCD
}


func mapShopCDIntoShop(shopCD: ShopCD) -> Shop {
    
    let shop = Shop(name: shopCD.name!)
    
    shop.address            = shopCD.address            ?? ""
    shop.description_en     = shopCD.description_en     ?? ""
    shop.description_es     = shopCD.description_es     ?? ""
    shop.email              = shopCD.email              ?? ""
    shop.image              = shopCD.imageURL           ?? ""
    shop.logo               = shopCD.logoURL            ?? ""
    shop.latitude           = shopCD.latitude
    shop.longitude          = shopCD.longitude
    shop.openingHours_en    = shopCD.openingHours_en    ?? ""
    shop.openingHours_es    = shopCD.openingHours_es    ?? ""
    shop.telephone          = shopCD.telephone          ?? ""
    shop.url                = shopCD.url                ?? ""
    
    return shop
    
}


func downloadAndCacheImage(urlString: String) -> Data {
    
    var data = Data()
    
    if let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
        let myUrl = URL(string: url) {
        do {
            data = try Data(contentsOf: myUrl)
            return data
        } catch {
            // no_image.png in case of error
            print("💩 Error al crear la UIImage con URL: " + url)
        }
    }
    return data
}





















