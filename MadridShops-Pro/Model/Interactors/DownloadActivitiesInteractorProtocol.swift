//
//  DownloadActivitiesInteractorProtocol.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 21/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation


protocol DownloadActivitiesInteractorProtocol {
    func execute(onSuccess: @escaping (Activities) -> Void, onError: ((String) -> Void)?)
    func execute(onSuccess: @escaping (Activities) -> Void)
}
