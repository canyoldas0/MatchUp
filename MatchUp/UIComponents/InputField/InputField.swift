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
    private lazy var textField: UITextField = {
        let temp = UITextField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .labelDark
        temp.attributedPlaceholder = NSAttributedString(
            string: "placeholder text",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.labelPassiveDark,
                NSAttributedString.Key.font: UIFont.mainRegular.withSize(15)
            ]
        )
        temp.delegate = self
        return temp
    }()
    
    // MARK: Properties
    
    /// Property that helps you to set bottomline color when textfield is active.
    var bottomLineActiveColor: UIColor = .labelBlue
    private var bottomLineConstraint: NSLayoutConstraint!
    private(set) lazy var bottomLine = UIView()
    var delegate: InputFieldDelegate? {
        didSet {
            delegate?.configureUI(inputField: self)
        }
    }
    
    
    // MARK: Textfield Related Properties
    /// Main reason to have this properties in this way is to abstract the textfield and make it inaccessible from outside.
    
    /// String value for textfield's active text.
    var text: String? {
        get {
            textField.text
        } set {
            textField.text = newValue
        }
    }
    
    /// Boolean value for whether textfield is in editing or not.
    var isEditing: Bool? {
        textField.isEditing
    }
    
    /// Boolean value that indicates  textfield characters are masked or not.
    var isSecureTextEntry: Bool {
        get {
            textField.isSecureTextEntry
        } set {
            textField.isSecureTextEntry = newValue
        }
    }
    
    /// String value for textfield's placeholder.
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
        bottomLine.backgroundColor = textField.isEditing ? bottomLineActiveColor : .lightGray
        bottomLineConstraint.constant = textField.isEditing ? 1.5 : 0.5
        layoutIfNeeded()
    }
    
    func didBeginEditing() {
        // when
        updateBorderStatus()
        // then
        delegate?.didBeginEditing(inputField: self)
    }
    
    func didEndEditing() {
        // when
        updateBorderStatus()
        // then
        delegate?.didEndEditing(inputField: self)
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
