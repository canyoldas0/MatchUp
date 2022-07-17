//
//  WalkthroughViewModel.swift
//  MatchUp
//
//  Created by Can Yoldaş on 17.07.2022.
//

import Foundation

final class WalkthroughViewModel: WalkthroughViewModelProtocol {
    
    var coordinatorDelegate: WalkthroughCoordinatorProtocol?
    
    func getStartedClicked() {
        coordinatorDelegate?.goToMain()
    }
    
    func signInClicked() {
        coordinatorDelegate?.goToSignIn()
    }
}
