//
//  LoginViewController.swift
//  MatchUp
//
//  Created by Can Yoldaş on 17.07.2022.
//

import UIKit

class LoginViewController: BaseViewController {
    
    lazy var inputField: InputField = {
       let temp = InputField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(inputField)
        
        NSLayoutConstraint.activate([

            inputField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            inputField.heightAnchor.constraint(equalToConstant: 52),
            inputField.widthAnchor.constraint(equalToConstant: 352)
        ])
        
//        let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))     
//        inputField.setLeftView(view: searchIcon)
    }
    
}
