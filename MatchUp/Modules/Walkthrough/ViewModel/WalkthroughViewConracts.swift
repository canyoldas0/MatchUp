//
//  WalkthroughViewModelConracts.swift
//  MatchUp
//
//  Created by Can Yoldaş on 17.07.2022.
//

import Foundation

protocol WalkthroughViewModelProtocol {
    
    var coordinatorDelegate: WalkthroughCoordinatorProtocol? {get set}
    func getStartedClicked()
    func signInClicked()
}

protocol WalkthroughCoordinatorProtocol {
    func start()
    func goToSignIn()
    func goToMain()
}
