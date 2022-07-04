//
//  UILabel+Extensions.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import UIKit

extension UILabel {
    
    static func make(
        title: String? = nil,
        font: UIFont? = nil,
        textColor: UIColor? = .primary,
        opacity: Float = 1,
        alpha: CGFloat = 1
    ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.text = title
        label.textColor = textColor
        label.layer.opacity = opacity
        label.alpha = alpha
        return label
    }
}

