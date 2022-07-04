//
//  SplashCoordinator.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import Foundation
import UIKit

final class SplashCoordinator: CoordinatorProtocol {
    var parentCoordinator: ParentCoordinatorDelegate?
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
    
    func goToMain() {
        let mainVC = UIViewController()
        mainVC.view.backgroundColor = .red
        
        rootViewController.viewControllers.removeAll()
        rootViewController.viewControllers = [mainVC]
        childDidFinish(child: self)
    }
    
}
