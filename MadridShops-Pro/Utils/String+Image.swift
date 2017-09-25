//
//  String+Image.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import CoreData

extension String {
    
    func loadImage(into imageView: UIImageView) {
        
        if let url = URL(string: self),
            let data = NSData(contentsOf: url),
            let image = UIImage(data: data as Data){
            
            OperationQueue.main.addOperation {
                imageView.image = image
            }
        }
    }
    
    
    func loadImageNSURLSession(into imageView: UIImageView) {
        
        let session = URLSession.shared
        
        if let url = URL(string: self) {
            session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                
                if error == nil,
                    data != nil,
                    let image = UIImage(data: data!) {
                    
                    OperationQueue.main.addOperation {
                        imageView.image = image
                    }
                    
                } else {
                    print("💩 Error al descargar la imagen de la url: " + self)
                }
                
            }).resume()
        }
    }
    
    
}







    
    
    
    
    
    
    

