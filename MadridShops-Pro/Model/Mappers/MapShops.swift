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
    // shopCD.image =
    shopCD.logoURL          = shop.logo
    // shopCD.logo =
    shopCD.latitude         = shop.latitude ?? 0.0
    shopCD.longitude        = shop.longitude ?? 0.0
    shopCD.name             = shop.name
    shopCD.openingHours_en  = shop.openingHours_en
    shopCD.openingHours_es  = shop.openingHours_es
    shopCD.telephone        = shop.telephone
    shopCD.url              = shop.url
    
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





















