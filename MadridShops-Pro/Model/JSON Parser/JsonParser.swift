//
//  JsonParser.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation


func parseShops(_ data: Data) -> Shops {
    
    let shops = Shops()
    
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data,
                                                          options: .allowFragments) as! Dictionary<String,Any>
        let result = jsonObject["result"] as! [Dictionary<String,Any>]
        
        for shopJson in result {
            let shop = Shop(name: shopJson["name"] as! String)
            shop.description_en = shopJson["description_en"] as! String
            shop.description_es = shopJson["description_es"] as! String
            shop.image = shopJson["img"] as! String
            shop.logo = shopJson["logo_img"] as! String
            shop.openingHours_en = shopJson["opening_hours_en"] as! String
            shop.openingHours_es = shopJson["opening_hours_es"] as! String
            shop.address = shopJson["address"] as! String
            shop.email = shopJson["email"] as! String
            shop.url = shopJson["url"] as! String
            shop.telephone = shopJson["telephone"] as! String
            shop.latitude = Float((shopJson["gps_lat"]! as! String)
                .trimmingCharacters(in: .whitespaces)
                .replacingOccurrences(of: ",", with: ""))
            shop.longitude = Float((shopJson["gps_lon"]! as! String)
                .trimmingCharacters(in: .whitespaces)
                .replacingOccurrences(of: ",", with: ""))
            
            shops.add(shop: shop)
        }
        
    } catch  {
        print("💩 Error parsing JSON.")
    }
    
    return shops
}
