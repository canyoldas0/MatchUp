//
//  SplashViewController.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import UIKit

class SplashViewController: BaseViewController {
    
    private(set) var viewModel: SplashViewModelProtocol!

    private let label = UILabel.make(
        title: "app_name".localized(),
        font: .mainSemibold.withSize(32),
        alpha: 0
        )
    
    convenience init(viewModel: SplashViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
        self.viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.load()
    }
    
    override func configureUI() {
        super.configureUI()
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
        
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func startAnimation() {
        
        if self.label.alpha == 0 {
            UIView.animate(withDuration: 1.2,
                           delay: 0.2,
                           options: .curveEaseOut,
                           animations: {
                self.label.alpha = 1.0
            }, completion: { isFinished in
                if isFinished {
                    self.endAnimation()
                }
            })
        }
    }
    
    private func endAnimation() {
        
        if self.label.alpha == 1 {
            UIView.animate(withDuration: 1.5,
                           delay: 0.2,
                           options: .curveEaseOut,
                           animations: {
                self.label.alpha = 0.0
            }, completion: { isFinished in
                if isFinished {
                    self.viewModel.didEndAnimation()
                }
            })
        }
    }
}

extension SplashViewController: SplashViewProtocol {
    
    func handleOutput(_ output: SplashViewOutput) {
        switch output {
        case .startAnimation:
            self.startAnimation()
        }
    }
}
