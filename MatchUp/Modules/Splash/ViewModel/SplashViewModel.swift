//
//  SplashViewModel.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import Foundation

class SplashViewModel: SplashViewModelProtocol {
    
    weak var coordinatorDelegate: SplashCoordinatorDelegate?
    weak var delegate: SplashViewProtocol?
    
    // Default Requests
    func load() {
        delegate?.handleOutput(.startAnimation)
    }
    
    func didEndAnimation() {
        coordinatorDelegate?.goToMain()
    }
    

}
