//
//  TestShops.swift
//  MadridShops-ProTests
//
//  Created by MIGUEL JARDÓN PEINADO on 28/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import XCTest
@testable import MadridShops_Pro

class TestShops: XCTestCase {
    
    var shopList1: Shops!
    var shopList2: Shops!
    
    override func setUp() {
        super.setUp()
        
        let shop1 = Shop(name: "shop1")
        let shop2 = Shop(name: "shop2")
        let shop3 = Shop(name: "shop3")
        
        shopList1 = Shops()
        shopList1.add(shop: shop1)
        shopList1.add(shop: shop2)
        
        shopList2 = Shops()
        shopList2.add(shop: shop1)
        shopList2.add(shop: shop2)
        shopList2.add(shop: shop3)
        
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    
    func testShopsExistance() {
        XCTAssertNotNil(shopList1)
    }
    
    func testShopsCount() {
        XCTAssertEqual(shopList1.count(), 2)
        XCTAssertNotEqual(shopList1.count(), shopList2.count())
    }
    
    func testShopsAddShop() {
        XCTAssertEqual(shopList1.count(), 2)
        
        let shopTest = Shop(name: "stopTest")
        shopList1.add(shop: shopTest)
        XCTAssertEqual(shopList1.count(), 3)
    }
    
    func testShopsGetShop() {
        XCTAssertEqual(shopList1.get(index: 0).name, "shop1")
        XCTAssertNotEqual(shopList1.get(index: 0).name, "false shop")
        XCTAssertEqual(shopList2.get(index: 2).name, "shop3")
    }

    
}


























