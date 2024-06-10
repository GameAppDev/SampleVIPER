//
//  CustomNavigationBar.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 10.06.2024.
//

import UIKit

protocol ICustomNavigationBar: AnyObject {
    func handleNavigationBarButton(type: CustomNavigationBar.ButtonType)
}

final class CustomNavigationBar: UIView {
    
    // MARK: Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var leftButton: UIButton!
    @IBOutlet private weak var rightButton: UIButton!
    
    // MARK: Properties
    private weak var delegate: ICustomNavigationBar?
    private var leftButtonType: ButtonType?
    private var rightButtonType: ButtonType?
    
    // MARK: Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupViews()
    }
    
    // MARK: Methods
    func configureView(
        delegate: ICustomNavigationBar?,
        title: String?,
        leftButtonType: ButtonType?,
        rightButtonType: ButtonType?
    ) {
        self.delegate = delegate
        
        titleLabel.text = title ?? "SampleVIPER"
        
        leftButton.isHidden = true
        self.leftButtonType = leftButtonType
        if let leftButtonType {
            leftButton.setImage(leftButtonType.image, for: .normal)
            leftButton.isHidden = false
        }
        
        rightButton.isHidden = true
        self.rightButtonType = rightButtonType
        if let rightButtonType {
            rightButton.setImage(rightButtonType.image, for: .normal)
            rightButton.isHidden = false
        }
    }
    
    private func setupViews() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            containerView.backgroundColor = .navbarBGColor
            
            titleLabel.font = .navbarTitleFont
            titleLabel.textColor = .navbarItemsColor
            
            leftButton.contentVerticalAlignment = .bottom
            leftButton.contentHorizontalAlignment = .left
            leftButton.contentEdgeInsets = .init(top: .zero, left: .init(10),
                                                 bottom: .init(10), right: .zero)
            leftButton.tintColor = .navbarItemsColor
            
            rightButton.contentVerticalAlignment = .bottom
            rightButton.contentHorizontalAlignment = .right
            rightButton.contentEdgeInsets = .init(top: .zero, left: .zero,
                                                  bottom: .init(10), right: .init(10))
            rightButton.tintColor = .navbarItemsColor
        }
    }
}

// MARK: UIButton Actions
extension CustomNavigationBar {
    
    @IBAction private func leftButtonClicked(_ sender: UIButton) {
        guard let leftButtonType else { return }

        delegate?.handleNavigationBarButton(type: leftButtonType)
    }
    
    @IBAction private func rightButtonClicked(_ sender: UIButton) {
        guard let rightButtonType else { return }

        delegate?.handleNavigationBarButton(type: rightButtonType)
    }
}

extension CustomNavigationBar {
    
    enum ButtonType {
        case back
        case close
        
        var image: UIImage {
            switch self {
            case .back:
                return .init(systemName: "arrowshape.backward.fill",
                             withConfiguration: UIImage.SymbolConfiguration(pointSize: .init(20),
                                                                            weight: .bold,
                                                                            scale: .large)) ?? UIImage()
            case .close:
                return .init(systemName: "xmark.circle.fill",
                             withConfiguration: UIImage.SymbolConfiguration(pointSize: .init(20),
                                                                            weight: .bold,
                                                                            scale: .large)) ?? UIImage()
            }
        }
    }
}
