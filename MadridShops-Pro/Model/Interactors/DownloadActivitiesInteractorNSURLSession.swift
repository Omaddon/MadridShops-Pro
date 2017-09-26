//
//  DownloadActivitiesInteractorNSURLSession.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit


class DownloadActivitiesInteractorNSURLSession: DownloadActivitiesInteractorProtocol {   
    
    func execute(onSuccess: @escaping (Activities) -> Void, onError: ((String) -> Void)?) {
        
        let session = URLSession.shared
        
        if let url = URL(string: activitiesURL) {
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                
                if error != nil {
                    
                    if let myError = onError {
                        myError("conexionError")
                    }
                } else {
                    
                    if data != nil {
                        let activities = parseActivities(data!, onError)
                        OperationQueue.main.addOperation {
                            onSuccess(activities)
                        }
                    }
                }
            })
            task.resume()
        } else {
            if let myError = onError {
                myError("urlError")
            }
        }
    }
    
    func execute(onSuccess: @escaping (Activities) -> Void) {
        self.execute(onSuccess: onSuccess, onError: nil)
    }
}
