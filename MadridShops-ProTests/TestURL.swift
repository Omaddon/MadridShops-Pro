//
//  TestURL.swift
//  MadridShops-ProTests
//
//  Created by MIGUEL JARDÓN PEINADO on 28/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import XCTest
@testable import MadridShops_Pro

class TestURL: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
    func testURL() {
        let shopsUrl = URL(string: shopsURL)
        XCTAssertNotNil(shopsUrl)
        
        let activitiesUrl = URL(string: activitiesURL)
        XCTAssertNotNil(activitiesUrl)
        
        let apiUrl = URL(string: mapAPI)
        XCTAssertNotNil(apiUrl)
        
        let falseURL = URL(string: "")
        XCTAssertNil(falseURL)
    }
    
}


























