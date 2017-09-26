//
//  MapActivities.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 22/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation
import CoreData


func mapActivityIntoActivityCD(context: NSManagedObjectContext,
                               activity: Activity) -> ActivityCD {
    
    let activityCD = ActivityCD(context: context)
    
    activityCD.address          = activity.address
    activityCD.description_en   = activity.description_en
    activityCD.description_es   = activity.description_es
    activityCD.email            = activity.email
    activityCD.imageURL         = activity.image
    activityCD.logoURL          = activity.logo
    activityCD.latitude         = activity.latitude ?? 0.0
    activityCD.longitude        = activity.longitude ?? 0.0
    activityCD.name             = activity.name
    activityCD.openingHours_en  = activity.openingHours_en
    activityCD.openingHours_es  = activity.openingHours_es
    activityCD.telephone        = activity.telephone
    activityCD.url              = activity.url
    
    let serialQueue = DispatchQueue(label: "DownloadImageQueue")
    serialQueue.sync {
        activityCD.logo = downloadAndCacheImage(urlString: activity.logo)
        activityCD.image = downloadAndCacheImage(urlString: activity.image)
        
        let urlString = mapAPI + "\(activity.latitude!),\(activity.longitude!)"
        activityCD.mapImage = downloadAndCacheImage(urlString: urlString)
    }
    
    return activityCD
}


func mapActivityCDIntoActivity(activityCD: ActivityCD) -> Activity {
    
    let activity = Activity(name: activityCD.name!)
    
    activity.address            = activityCD.address            ?? ""
    activity.description_en     = activityCD.description_en     ?? ""
    activity.description_es     = activityCD.description_es     ?? ""
    activity.email              = activityCD.email              ?? ""
    activity.image              = activityCD.imageURL           ?? ""
    activity.logo               = activityCD.logoURL            ?? ""
    activity.latitude           = activityCD.latitude
    activity.longitude          = activityCD.longitude
    activity.openingHours_en    = activityCD.openingHours_en    ?? ""
    activity.openingHours_es    = activityCD.openingHours_es    ?? ""
    activity.telephone          = activityCD.telephone          ?? ""
    activity.url                = activityCD.url                ?? ""
    
    return activity
    
}






















