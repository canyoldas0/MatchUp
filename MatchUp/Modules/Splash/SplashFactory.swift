//
//  SplashFactory.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import Foundation
import UIKit

protocol SplashFactoryDelegate: AnyObject {
    func build(coordinatorDelegate: SplashCoordinatorDelegate) -> UIViewController
}

class SplashFactory: SplashFactoryDelegate {
    
    func build(coordinatorDelegate: SplashCoordinatorDelegate) -> UIViewController {
        let splashVM = SplashViewModel()
        splashVM.coordinatorDelegate = coordinatorDelegate
        let splashVC = SplashViewController(viewModel: splashVM)
        splashVM.delegate = splashVC
        return splashVC
    }
}
