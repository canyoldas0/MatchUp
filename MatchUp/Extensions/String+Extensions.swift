//
//  String+Extensions.swift
//  MatchUp
//
//  Created by Can Yoldaş on 4.07.2022.
//

import Foundation

extension String {
    
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
