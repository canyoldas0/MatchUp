//
//  WalkthroughScrollCell.swift
//  MatchUp
//
//  Created by Can Yoldaş on 17.07.2022.
//

import UIKit
import CYBase

struct WalkthroughCellData: CYDataProtocol {
    
    private(set) var iconName: String
    private(set) var title: String
    private(set) var subTitle: String
    
    
    static func getScrollData() -> [Self] {
        return [
            .init(iconName: "searchIcon",
                      title: "Search for Perfect Match",
                      subTitle: "Filter your expectations from your future matchUp."),
                .init(iconName: "sendMessageIcon",
                      title: "Take the First Step",
                      subTitle: "Send message to your future matchUp."),
            .init(iconName: "rankingIcon",
                  title: "Start Winning Together",
                  subTitle: "Meet your matchUp and start playing together.")
        ]
    }
}

class WalkthroughScrollCell: CYCollectionViewCell {
    
    private lazy var iconView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var title: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "Title"
        temp.font = .mainSemibold.withSize(27)
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.textAlignment = .center
        temp.textColor = .labelDark
        return temp
    }()
    
    private lazy var subTitle: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "Subtitle"
        temp.font = .mainRegular.withSize(15)
        temp.textColor = .labelPassiveDark
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.textAlignment = .center
        return temp
    }()
    
    
    override func addViewComponents() {
        super.addViewComponents()
        
        addSubview(iconView)
        addSubview(title)
        addSubview(subTitle)
        
        NSLayoutConstraint.activate([
            
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            iconView.widthAnchor.constraint(equalToConstant: 149),
            iconView.heightAnchor.constraint(equalToConstant: 149),
            
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 75),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            title.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -40),

            
            subTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            subTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            subTitle.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
    
    
    func setData(with data: WalkthroughCellData) {
        iconView.image = UIImage(named: data.iconName)
        title.text = data.title
        subTitle.text = data.subTitle
    }
    
}
