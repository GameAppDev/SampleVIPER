//
//  AppDelegate.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        applicationInit(application, didFinishLaunchingWithOptions: launchOptions)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        AppRouter.shared.openApp()
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        registerForPushNotifications()
        checkATTPermission {
            debugPrint("<--- ATTPermission authorized --->")
        }
    }
}
