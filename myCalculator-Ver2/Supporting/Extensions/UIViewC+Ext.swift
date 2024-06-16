//
//  UIViewC+Ext.swift
//  myCalculator-Ver2
//
//  Created by Kirill Sklyarov on 16.06.2024.
//

import UIKit

extension UIViewController {

    func setupButton(title: String, color: Color, action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = color.uiColor
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    func setupHorizontalStack(arrangedSubviews: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
