//
//  TestActivities.swift
//  MadridShops-ProTests
//
//  Created by MIGUEL JARDÓN PEINADO on 28/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import XCTest
@testable import MadridShops_Pro

class TestActivities: XCTestCase {
    
    var activityList1: Activities!
    var activityList2: Activities!
    
    override func setUp() {
        super.setUp()
        
        let activity1 = Activity(name: "activity1")
        let activity2 = Activity(name: "activity2")
        let activity3 = Activity(name: "activity3")
        
        activityList1 = Activities()
        activityList1.add(activity: activity1)
        activityList1.add(activity: activity2)
        
        activityList2 = Activities()
        activityList2.add(activity: activity1)
        activityList2.add(activity: activity2)
        activityList2.add(activity: activity3)
        
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    
    func testShopsExistance() {
        XCTAssertNotNil(activityList1)
    }
    
    func testShopsCount() {
        XCTAssertEqual(activityList1.count(), 2)
        XCTAssertNotEqual(activityList1.count(), activityList2.count())
    }
    
    func testShopsAddShop() {
        XCTAssertEqual(activityList1.count(), 2)
        
        let activityTest = Activity(name: "activityTest")
        activityList1.add(activity: activityTest)
        XCTAssertEqual(activityList1.count(), 3)
    }
    
    func testShopsGetShop() {
        XCTAssertEqual(activityList1.get(index: 0).name, "activity1")
        XCTAssertNotEqual(activityList1.get(index: 0).name, "false shop")
        XCTAssertEqual(activityList2.get(index: 2).name, "activity3")
    }
    
}
