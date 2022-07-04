//
//  AppCoordinator.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import Foundation
import UIKit

final class AppCoordinator: CoordinatorProtocol {
    weak var parentCoordinator: ParentCoordinatorDelegate?
    var children: [CoordinatorProtocol] = []
    private(set) var rootViewController: UINavigationController!
    private let dependencyContainer: DependencyContainer
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
    }
    
    func start() {
        let splashCoordinator = SplashCoordinator(dependencyContainer: dependencyContainer)
        splashCoordinator.parentCoordinator = self
        children.append(splashCoordinator)
        splashCoordinator.start()
        self.rootViewController = splashCoordinator.rootViewController
    }
}


