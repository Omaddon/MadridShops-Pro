//
//  Activities.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation


public protocol ActivitiesProtocol {
    func count() -> Int
    func add(activity: Activity)
    func get(index: Int) -> Activity
}


public class Activities: ActivitiesProtocol {
    private var activityList: [Activity]?
    
    public init() {
        self.activityList = []
    }
    
    public func count() -> Int {
        return activityList?.count ?? 0
    }
    
    public func add(activity: Activity) {
        activityList?.append(activity)
    }
    
    public func get(index: Int) -> Activity {
        return activityList![index]
    }
    
    
}
