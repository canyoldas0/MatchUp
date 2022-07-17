//
//  SplashViewDelegate.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import Foundation

protocol SplashViewProtocol: AnyObject {
    
    func handleOutput(_ output: SplashViewOutput)
}

protocol SplashViewModelProtocol: AnyObject {
    var coordinatorDelegate: SplashCoordinatorDelegate? {get set}
    var delegate: SplashViewProtocol? { get set}
    func load()
    func didEndAnimation()
}

enum SplashViewOutput {
    
    case startAnimation
}
