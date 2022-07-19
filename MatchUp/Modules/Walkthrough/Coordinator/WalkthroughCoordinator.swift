//
//  WalkthroughCoordinator.swift
//  MatchUp
//
//  Created by Can Yoldaş on 17.07.2022.
//

import UIKit

final class WalkthroughCoordinator: CoordinatorProtocol, WalkthroughCoordinatorProtocol {
    weak var parentCoordinator: ParentCoordinatorDelegate?
    var children: [CoordinatorProtocol] = []
    private(set) var rootViewController: UINavigationController!
    private let dependencyContainer: DependencyContainer
    
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
    }
    
    func start() {
        let viewModel = WalkthroughViewModel()
        viewModel.coordinatorDelegate = self
        let walkthroughVC = WalkthroughViewController(viewModel: viewModel)
        
        dependencyContainer.window.rootViewController = walkthroughVC
    }
    
    func goToSignIn() {
        print("sign in coordinator")
        let loginVC = LoginViewController()
        loginVC.title = "Login"
        let navigationVC = UINavigationController(rootViewController: loginVC)
        
        dependencyContainer.window.rootViewController = navigationVC
        dismiss()
    }
    
    func goToMain() {
        print("go to main clicked")
    }
    
}
