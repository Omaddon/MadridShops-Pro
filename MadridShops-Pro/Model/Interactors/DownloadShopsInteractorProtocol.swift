//
//  DownloadShopsInteractorProtocol.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation


protocol DownloadShopsInteractorProtocol {
    func execute(onSuccess: @escaping (Shops) -> Void, onError: ((String) -> Void)?)
    func execute(onSuccess: @escaping (Shops) -> Void)
}
