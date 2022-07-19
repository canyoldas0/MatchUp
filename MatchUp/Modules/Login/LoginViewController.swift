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
    
    lazy var forgotPasswordButton: UIButton = {
       let temp = UIButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.setTitle("forgot_password".localized(), for: .normal)
        temp.titleLabel?.font = .mainMedium.withSize(15)
        temp.setTitleColor(UIColor.labelBlue, for: .normal)
        return temp
    }()
    
    private let inputStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        prepareUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let bar =  navigationController?.navigationBar
        bar?.prefersLargeTitles = true
        bar?.tintColor = .white
        bar?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.labelDark]
    }
    
    private func prepareUI() {
        inputStack.axis = .vertical
        inputStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputStack)
        
        usernameInputField.delegate = InputFieldDelegate(inputType: .phoneNumber)
        passwordInputField.delegate = InputFieldDelegate(inputType: .password)
        
        NSLayoutConstraint.activate([
            inputStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            inputStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            inputStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            usernameInputField.heightAnchor.constraint(equalToConstant: 52),
            passwordInputField.heightAnchor.constraint(equalToConstant: 52),
        ])
        
        inputStack.addArrangedSubview(usernameInputField)
        inputStack.addArrangedSubview(passwordInputField)
        inputStack.addArrangedSubview(forgotPasswordButton)
        
        inputStack.setCustomSpacing(20, after: usernameInputField)
        inputStack.setCustomSpacing(26, after: passwordInputField)
    
    }
    
    
}
