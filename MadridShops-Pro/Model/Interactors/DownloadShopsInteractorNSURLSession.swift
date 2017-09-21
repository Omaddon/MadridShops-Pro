//
//  DownloadShopsInteractorNSURLSession.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation


class DownloadShopsInteractorNSURLSession: DownloadShopsInteractorProtocol {
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: ((Error) -> Void)?) {
        
        let session = URLSession.shared
        
        if let url = URL(string: shopsURL) {
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                
                if error != nil {
                    
                    if let myError = onError {
                        myError(error!)
                    }
                } else {
                    
                    if data != nil {
                        let shops = parseShops(data!)
                        OperationQueue.main.addOperation {
                            onSuccess(shops)
                        }
                    }
                }
            })
            task.resume()
        }
        
        
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        self.execute(onSuccess: onSuccess, onError: nil)
    }
    
    
}
