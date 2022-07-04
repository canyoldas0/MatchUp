//
//  BaseViewController.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import class UIKit.UIViewController
import CYBase

class BaseViewController: UIViewController {
    
    private var identifier: String {
        return String(describing: self)
    }
    
    deinit {
        print("DEINIT \(identifier)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() { }
    
}
