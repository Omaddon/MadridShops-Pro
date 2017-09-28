//
//  TestActivity.swift
//  MadridShops-ProTests
//
//  Created by MIGUEL JARDÓN PEINADO on 28/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import XCTest
@testable import MadridShops_Pro

class TestActivity: XCTestCase {
    
    var activity1: Activity!
    var activity2: Activity!
    
    override func setUp() {
        super.setUp()
        
        activity1 = Activity(name: "activity1")
        activity1.address = "activity1_address"
        activity1.description_en = "activity1_description_en"
        activity1.description_es = "activity1_description_en"
        activity1.email = "activity1_email"
        activity1.image = "activity1_image"
        activity1.latitude = 5.0
        activity1.longitude = 42.0
        activity1.logo = "activity1_logo"
        activity1.openingHours_en = "activity1_hours_en"
        activity1.openingHours_es = "activity1_hours_es"
        activity1.telephone = "(99)999-99-99"
        activity1.url = "activity1_url"
        
        activity2 = Activity(name: "activity2")
        activity2.address = "activity2_address"
        activity2.description_en = "activity2_description_en"
        activity2.description_es = "activity2_description_en"
        activity2.email = "activity2_email"
        activity2.image = "activity2_image"
        activity2.latitude = -5.0
        activity2.longitude = -42.0
        activity2.logo = "activity2_logo"
        activity2.openingHours_en = "activity2_hours_en"
        activity2.openingHours_es = "activity2_hours_es"
        activity2.telephone = "(99)999-99-99"
        activity2.url = "activity2_url"
        
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func shopExists() {
        let activityTest = Shop(name: "ActivityTest")
        XCTAssertNotNil(activityTest)
    }
    
    func shopsNotEqual() {
        XCTAssertNotEqual(activity1.name, activity2.name)
    }
    
}
























