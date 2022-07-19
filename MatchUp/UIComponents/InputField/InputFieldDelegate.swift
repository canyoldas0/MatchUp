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
    case phoneNumber
    
    var format: String {
        switch self {
        case .phoneNumber:
            return "nnnn nnn nn nn"
        default:
            return ""
        }
    }
    
    var prefix: String {
        switch self {
        case .phoneNumber:
            return "05"
        default:
            return ""
        }
    }
}


/// This class is for managing custom InputField.
/// Logics will be modified over there according to inputType
class InputFieldDelegate {
    
    private let inputType: InputType
    private let minLength: Int
    private let maxLength: Int
    
    /// These handlers for manipulating the text data coming from the textfield if needed.
    public var textFieldEndEditing: GenericHandler<Bool>?
    public var textFieldValueChanged: GenericHandler<String>?
    public var textCountHandler: GenericHandler<Int>?
    
    init(
        inputType: InputType,
        maxLength: Int = 20,
        minLength: Int = 0
    ) {
        self.inputType = inputType
        self.maxLength = maxLength
        self.minLength = minLength
    }
    
    func configureUI(inputField: InputField) {
        
        if inputType == .password {
            inputField.isSecureTextEntry = true
        }
    }
    
    func didBeginEditing(inputField: InputField) {
        guard let text = inputField.text,
              text.isEmpty else {
            return
        }
        //
        inputField.text = inputType.prefix
    }
    
    func didEndEditing(inputField: InputField) {
        //
    }
    
    func shouldReturn(inputField: InputField) -> Bool {
        return inputField.endEditing(true)
    }
}
