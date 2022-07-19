//
//  InputFieldDelegate.swift
//  MatchUp
//
//  Created by Can Yoldaş on 18.07.2022.
//

import Foundation

enum InputType {
    case numeric
    case alpha
    case password
}

/// This class is for managing custom InputField.
/// Logics will be modified over there according to inputType
class InputFieldDelegate {
    
    private let inputType: InputType
    
    init(inputType: InputType) {
        self.inputType = inputType
    }
    
    func configureUI(inputField: InputField) {
        setPlaceholder(inputField: inputField)
        
        switch inputType {
        case .password:
            inputField.textField.isSecureTextEntry = true
        default:
            break
        }
    }
    
    private func setPlaceholder(inputField: InputField) {
        
        var placeholder = ""
        
        switch inputType {
        case .password:
            placeholder = "Enter your password"
        default:
            break
        }
        
        inputField.placeholder = placeholder
    }
    
}
