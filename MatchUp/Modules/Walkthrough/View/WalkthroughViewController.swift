//
//  WalkthroughViewController.swift
//  MatchUp
//
//  Created by Can Yoldaş on 11.07.2022.
//

import UIKit

class WalkthroughViewController: BaseViewController {
    
    private let pageControl: UIPageControl = {
        let temp = UIPageControl()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        temp.preferredIndicatorImage = UIImage(named: "pageControlRectangle")
        temp.pageIndicatorTintColor = .gray
        temp.currentPageIndicatorTintColor = .labelBlue
        temp.backgroundStyle = .automatic
        temp.numberOfPages = 3
        return temp
    }()
    
    private let getStartedButton: UIButton = {
        let temp = UIButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .primary
        temp.titleLabel?.font = .mainSemibold.withSize(15)
        temp.setTitle("get_started".localized(), for: .normal)
        return temp
    }()
    
    private let alreadySignInLabel: UILabel = {
       let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "already_have_account".localized()
        temp.font = .mainRegular.withSize(15)
        temp.textColor = .black
        return temp
    }()
    
    private let signInButton: UIButton = {
       let temp = UIButton()
        temp.setTitle("sign_in".localized(), for: .normal)
        temp.setTitleColor(UIColor.labelBlue, for: .normal)
        temp.titleLabel?.font = .mainMedium.withSize(15)
        return temp
    }()
    
    private let labelStack: UIStackView = {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private let stackView: UIStackView = {
       let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.alignment = .center
        return temp
    }()
    
    override func configureUI() {
        super.configureUI()
        view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(pageControl)
        stackView.addArrangedSubview(getStartedButton)
        stackView.addArrangedSubview(labelStack)
        
        labelStack.addArrangedSubview(alreadySignInLabel)
        labelStack.addArrangedSubview(signInButton)
        
        stackView.setCustomSpacing(40, after: pageControl)
        stackView.setCustomSpacing(26, after: getStartedButton)
        
        labelStack.setCustomSpacing(2, after: alreadySignInLabel)
        
        NSLayoutConstraint.activate([
        
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -54),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            getStartedButton.heightAnchor.constraint(equalToConstant: 52),
            getStartedButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            getStartedButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
        ])
        
        getStartedButton.roundCorner(with: 26)
    }
}
