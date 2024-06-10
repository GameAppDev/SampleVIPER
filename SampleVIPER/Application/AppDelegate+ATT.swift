//
//  AppDelegate+ATT.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import Foundation
import AppTrackingTransparency

extension AppDelegate {
    
    func checkATTPermission(runBlock: @escaping (() -> Void)) {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                runBlock()
            default:
                debugPrint("<--- ATTrackingManager.requestTrackingAuthorization Status: \(status.rawValue) --->")
            }
        }
    }
}
