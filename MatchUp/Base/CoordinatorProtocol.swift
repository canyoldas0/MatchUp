//
//  Coordinator.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import Foundation

protocol CoordinatorProtocol: ParentCoordinatorDelegate {
    
    var parentCoordinator: ParentCoordinatorDelegate? {get set}
    func start()
}

protocol ParentCoordinatorDelegate: AnyObject {
    
    var children: [CoordinatorProtocol] {get set}
    func childDidFinish(child: CoordinatorProtocol)
}

extension CoordinatorProtocol {
    func dismiss() {
        parentCoordinator?.childDidFinish(child: self)
    }
}

extension ParentCoordinatorDelegate {
    
    func childDidFinish(child: CoordinatorProtocol) {
        children = children.filter( { $0 !== child })
    }
}
