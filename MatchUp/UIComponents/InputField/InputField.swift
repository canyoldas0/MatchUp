//
//  InputField.swift
//  MatchUp
//
//  Created by Can Yoldaş on 17.07.2022.
//

import UIKit
import CYBase

enum InputType {
    case numeric
    case alpha
    case email
    case password
    case fullName
}

class InputFieldDelegate {
    
    private let inputType: InputType
    
    init(inputType: InputType) {
        self.inputType = inputType
    }
}

class InputField: BaseView {
    
    private(set) lazy var textField: UITextField = {
       let temp = UITextField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .labelDark
        temp.attributedPlaceholder = NSAttributedString(string: "placeholder text", attributes: [NSAttributedString.Key.foregroundColor: UIColor.labelPassiveDark])
        temp.delegate = self
        return temp
    }()
       
    private var bottomLineConstraint: NSLayoutConstraint!
    private(set) lazy var bottomLine = UIView()
    
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
    
//    func setLeftView(view: UIView) {
//        textField.leftView = view
//        textField.leftViewMode = .always
//    }
    
    private func updateBorderStatus() {
        bottomLine.backgroundColor = textField.isEditing ? .labelBlue : .lightGray
        bottomLineConstraint = bottomLine.heightAnchor.constraint(equalToConstant: textField.isEditing ? 5: 0.5)
        
        layoutIfNeeded()
    }
    
    func didBeginEditing() {
        updateBorderStatus()
        //
    }
    
    func didEndEditing() {
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
