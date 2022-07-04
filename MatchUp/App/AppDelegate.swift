//
//  AppDelegate.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dependencyContainer: DependencyContainer!
    private var appCordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        dependencyContainer = DependencyContainer(window: window)
        
        appCordinator = AppCoordinator(dependencyContainer: dependencyContainer)
        appCordinator?.start()
        
        window.rootViewController = appCordinator?.rootViewController
        window.makeKeyAndVisible()
        
        return true
    }
    
}

