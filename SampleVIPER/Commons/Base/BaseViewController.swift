//
//  BaseViewController.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        resetNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupViews()
    }

    // MARK: Methods
    private func setupViews() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            view.backgroundColor = .baseViewBGColor
        }
    }
    
    func setNavigationBarItems(
        title: String?,
        leftButton: CustomNavigationBar.ButtonType? = nil,
        rightButton: CustomNavigationBar.ButtonType? = nil
    ) {
        guard let navigationBar = CustomNavigationBar().loadNib() as? CustomNavigationBar
        else { return }
        
        navigationBar.frame = getNavigationBarFrame()

        navigationBar.configureView(
            delegate: self,
            title: title,
            leftButtonType: leftButton,
            rightButtonType: rightButton
        )

        addNavigationBarView(navBarView: navigationBar)
    }
}

extension BaseViewController: ICustomNavigationBar {
    
    func handleNavigationBarButton(type: CustomNavigationBar.ButtonType) {
        switch type {
        case .back:
            navigationController?.popViewController(animated: true)
        case .close:
            dismiss(animated: true)
        }
    }
}
