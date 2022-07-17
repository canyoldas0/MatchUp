//
//  SplashCoordinator.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import class UIKit.UINavigationController
import class UIKit.UIViewController


final class SplashCoordinator: CoordinatorProtocol {
    weak var parentCoordinator: ParentCoordinatorDelegate?
    var children: [CoordinatorProtocol] = []
    private(set) var rootViewController: UINavigationController!
    private let dependencyContainer: DependencyContainer
    
    private lazy var factory = SplashFactory()
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
    }
    
    func start() {
        let splashVC = factory.build(coordinatorDelegate: self)
        rootViewController = UINavigationController(rootViewController: splashVC)
    }
    
}

extension SplashCoordinator: SplashCoordinatorDelegate {
    
    func startApp() {
        let walkthroughCoordinator = WalkthroughCoordinator(dependencyContainer: dependencyContainer)
        walkthroughCoordinator.parentCoordinator = parentCoordinator
        
        rootViewController.viewControllers.removeAll()        
        walkthroughCoordinator.start()
        dismiss()
    }
}

