//
//  LoginViewController.swift
//  MatchUp
//
//  Created by Can Yoldaş on 17.07.2022.
//

import UIKit

class LoginViewController: BaseViewController {
    
    lazy var usernameInputField: InputField = {
        let temp = InputField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.placeholder = "User name"
        return temp
    }()
    
    lazy var passwordInputField: InputField = {
        let temp = InputField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.placeholder = "Password"
        return temp
    }()
    
    private let inputStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        prepareUI()
    }
    
    private func prepareUI() {
        inputStack.axis = .vertical
        inputStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputStack)
        
        usernameInputField.delegate = InputFieldDelegate(inputType: .phoneNumber)
        passwordInputField.delegate = InputFieldDelegate(inputType: .password)
        
        NSLayoutConstraint.activate([
            inputStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            inputStack.widthAnchor.constraint(equalToConstant: 352),
            
            usernameInputField.heightAnchor.constraint(equalToConstant: 52),
            passwordInputField.heightAnchor.constraint(equalToConstant: 52),
        ])
        
        inputStack.addArrangedSubview(usernameInputField)
        inputStack.addArrangedSubview(passwordInputField)
        
        inputStack.setCustomSpacing(20, after: usernameInputField)
        
    }
    
    
}
