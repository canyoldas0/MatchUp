//
//  InputField.swift
//  MatchUp
//
//  Created by Can Yoldaş on 17.07.2022.
//

import UIKit
import CYBase

class InputField: BaseView {
    
    // MARK: Components
    private(set) lazy var textField: UITextField = {
       let temp = UITextField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .labelDark
        temp.attributedPlaceholder = NSAttributedString(string: "placeholder text", attributes: [NSAttributedString.Key.foregroundColor: UIColor.labelPassiveDark])
        temp.delegate = self
        return temp
    }()
       
    // MARK: Properties
    private var bottomLineConstraint: NSLayoutConstraint!
    private(set) lazy var bottomLine = UIView()
    var delegate: InputFieldDelegate? {
        didSet {
            delegate?.configureUI(inputField: self)
        }
    }
    
    var placeholder: String? {
        get {
            textField.placeholder
        } set {
            textField.placeholder = newValue
        }
    }
    
    override func addViewComponents() {
        super.addViewComponents()
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        addSubview(bottomLine)
        
        bottomLineConstraint = bottomLine.heightAnchor.constraint(equalToConstant: 0.5)
        NSLayoutConstraint.activate([
        
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            bottomLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLineConstraint
        ])
        
        bottomLine.backgroundColor = .lightGray
    }
    
    private func updateBorderStatus() {
        bottomLine.backgroundColor = textField.isEditing ? .labelBlue : .lightGray
        bottomLineConstraint.constant = textField.isEditing ? 1.5 : 0.5
        
        layoutIfNeeded()
    }
    
    func didBeginEditing() {
        // delegate?.didBeginEditing
        updateBorderStatus()
        //
    }
    
    func didEndEditing() {
        // delegate?.didBeginEditing
        updateBorderStatus()
        //
    }
}

extension InputField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.didBeginEditing()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.didEndEditing()
    }
}
