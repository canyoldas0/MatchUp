//
//  UIControl+Extensions.swift
//  MatchUp
//
//  Created by Can Yoldaş on 17.07.2022.
//

import UIKit

extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping ()->()) {
        addAction(UIAction { (action: UIAction) in closure() }, for: controlEvents)
    }
}
