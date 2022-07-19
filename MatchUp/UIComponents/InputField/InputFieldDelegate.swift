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
    
    /// These handlers for manipulating the text data coming from the textfield if needed.
    public var textFieldEndEditing: GenericHandler<Bool>?
    public var textFieldValueChanged: GenericHandler<String>?
    public var textCountHandler: GenericHandler<Int>?
    
    init(inputType: InputType) {
        self.inputType = inputType
    }
    
    func configureUI(inputField: InputField) {
        
        if inputType == .password {
            inputField.isSecureTextEntry = true
        }
    }
    
    func didBeginEditing(inputField: InputField) {
        guard let text = inputField.text else {
            return
        }
        //
        
    }
    
    func didEndEditing(inputField: InputField) {
        //
    }
}
