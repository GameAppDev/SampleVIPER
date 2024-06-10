//
//  AppRouter.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import UIKit

protocol IAppRouter: AnyObject {
    func openApp()
}

open class AppRouter {
    
    static let shared = AppRouter()
    
    // MARK: Properties
    private var navigationController: UINavigationController?
    
    private static var window: UIWindow? {
        return UIApplication.shared.delegate?.window ?? UIWindow(frame: UIScreen.main.bounds)
    }
    
    // MARK: Methods
    private func setActiveNavigationController(with rootVC: UIViewController) {
        let navController = UINavigationController(rootViewController: rootVC)
        
        navigationController?.popToRootViewController(animated: false)
        navigationController = nil
        
        navigationController = navController
        
        AppRouter.window?.rootViewController = navController
        AppRouter.window?.makeKeyAndVisible()
    }
}

extension AppRouter: IAppRouter {
    
    func openApp() {
        setActiveNavigationController(
            with: UIViewController()
        )
    }
}
