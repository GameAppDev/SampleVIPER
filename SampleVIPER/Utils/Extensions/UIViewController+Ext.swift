//
//  UIViewController+Ext.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import UIKit

// MARK: NavigationBar
extension UIViewController {
    
    public static var window: UIWindow {
        UIApplication.shared.windows.filter { $0.isKeyWindow }.first ?? UIWindow()
    }
    private static let topSafeAreaHeight = window.safeAreaInsets.top
    private static let navigationBarHeight = UINavigationController().navigationBar.frame.height
    
    public func getNavigationBarFrame() -> CGRect {
        .init(
            x: 0,
            y: -UIViewController.topSafeAreaHeight,
            width: UIScreen.main.bounds.width,
            height: UIViewController.topSafeAreaHeight + UIViewController.navigationBarHeight
        )
    }
    
    public func resetNavigationBar() {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    public func addNavigationBarView(navBarView: UIView) {
        navigationController?.navigationBar.subviews.forEach({ $0.removeFromSuperview() })
        
        if let isContainsNavBarView = navigationController?.navigationBar.subviews.contains(navBarView),
           !isContainsNavBarView {
            navigationController?.navigationBar.addSubview(navBarView)
        }
        navBarView.layoutIfNeeded()
    }
}

// MARK: Navigation
extension UIViewController {
    
    public func presentWithNavigationController(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.barStyle = self.navigationController?.navigationBar.barStyle ?? .default
        present(navigationController, animated: animated, completion: completion)
    }
}
