//
//  BaseViewController.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import UIKit
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
        
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    func configureUI() { }
    
}
