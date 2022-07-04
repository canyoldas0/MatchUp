//
//  SplashFactory.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//


protocol SplashFactoryDelegate: AnyObject {
    func build(coordinatorDelegate: SplashCoordinatorDelegate) -> SplashViewController
}

class SplashFactory: SplashFactoryDelegate {
    
    func build(coordinatorDelegate: SplashCoordinatorDelegate) -> SplashViewController {
        let splashVM = SplashViewModel()
        splashVM.coordinatorDelegate = coordinatorDelegate
        let splashVC = SplashViewController(viewModel: splashVM)
        splashVM.delegate = splashVC
        return splashVC
    }
}
