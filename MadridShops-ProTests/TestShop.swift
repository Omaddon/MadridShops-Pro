//
//  TestShop.swift
//  MadridShops-ProTests
//
//  Created by MIGUEL JARDÓN PEINADO on 28/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import XCTest
@testable import MadridShops_Pro

class TestShop: XCTestCase {
    
    var shop1: Shop!
    var shop2: Shop!
    
    override func setUp() {
        super.setUp()

        shop1 = Shop(name: "shop1")
        shop1.address = "shop1_address"
        shop1.description_en = "shop1_description_en"
        shop1.description_es = "shop1_description_en"
        shop1.email = "shop1_email"
        shop1.image = "shop1_image"
        shop1.latitude = 5.0
        shop1.longitude = 42.0
        shop1.logo = "shop1_logo"
        shop1.openingHours_en = "shop1_hours_en"
        shop1.openingHours_es = "shop1_hours_es"
        shop1.telephone = "(99)999-99-99"
        shop1.url = "shop1_url"
        
        shop2 = Shop(name: "shop2")
        shop2.address = "shop2_address"
        shop2.description_en = "shop2_description_en"
        shop2.description_es = "shop2_description_en"
        shop2.email = "shop2_email"
        shop2.image = "shop2_image"
        shop2.latitude = -5.0
        shop2.longitude = -42.0
        shop2.logo = "shop2_logo"
        shop2.openingHours_en = "shop2_hours_en"
        shop2.openingHours_es = "shop2_hours_es"
        shop2.telephone = "(99)999-99-99"
        shop2.url = "shop2_url"
        
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func shopExists() {
        let shopTest = Shop(name: "ShopTest")
        XCTAssertNotNil(shopTest)
    }
    
    func shopsNotEqual() {
        XCTAssertNotEqual(shop1.name, shop2.name)
    }

}



























