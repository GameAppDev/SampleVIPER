//
//  AppRouter.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import UIKit

open class AppRouter {
    
    static let shared = AppRouter()
    
    // MARK: Properties
    private var navigationController: UINavigationController?
    
    private static var window: UIWindow? {
        return UIApplication.shared.delegate?.window ?? UIWindow(frame: UIScreen.main.bounds)
    }
    
    // MARK: Public Methods
    func openApp() {
        setActiveNavigationController(
            with: UIViewController()
        )
    }
    
    // MARK: Private Methods
    private func setActiveNavigationController(with rootVC: UIViewController) {
        let navController = UINavigationController(rootViewController: rootVC)
        
        navigationController?.popToRootViewController(animated: false)
        navigationController = nil
        
        navigationController = navController
        
        AppRouter.window?.rootViewController = navController
        AppRouter.window?.makeKeyAndVisible()
    }
}
