//
//  WalkthroughViewController.swift
//  MatchUp
//
//  Created by Can Yoldaş on 11.07.2022.
//

import UIKit

class WalkthroughViewController: BaseViewController {
    
    
    // MARK: UI Elements
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 500)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .clear
        temp.isPagingEnabled = true
        temp.register(WalkthroughScrollCell.self, forCellWithReuseIdentifier: WalkthroughScrollCell.identifier)
        return temp
    }()
    
    private let pageControl: UIPageControl = {
        let temp = UIPageControl()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        temp.preferredIndicatorImage = UIImage(named: "pageControlRectangle")
        temp.pageIndicatorTintColor = .disabled
        temp.currentPageIndicatorTintColor = .labelBlue
        temp.backgroundStyle = .automatic
        temp.numberOfPages = 3
        temp.isEnabled = false
        return temp
    }()
    
    private let getStartedButton: UIButton = {
        let temp = UIButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .primary
        temp.titleLabel?.font = .mainSemibold.withSize(15)
        temp.setTitle("get_started".localized(), for: .normal)
        return temp
    }()
    
    private let alreadySignInLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "already_have_account".localized()
        temp.font = .mainRegular.withSize(15)
        temp.textColor = .black
        return temp
    }()
    
    private let signInButton: UIButton = {
        let temp = UIButton()
        temp.setTitle("sign_in".localized(), for: .normal)
        temp.setTitleColor(UIColor.labelBlue, for: .normal)
        temp.titleLabel?.font = .mainMedium.withSize(15)
        return temp
    }()
    
    private let labelStack: UIStackView = {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private let stackView: UIStackView = {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.alignment = .center
        return temp
    }()
    
    // MARK: Properties
    
    private(set) var viewModel: WalkthroughViewModelProtocol!
    private let scrollItems: [WalkthroughCellData] = WalkthroughCellData.getScrollData()
    
    convenience init(viewModel: WalkthroughViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    
    // MARK: Setup Functions
    override func configureUI() {
        super.configureUI()
        configureButtonActions()
        view.backgroundColor = .white
        setupViews()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func configureButtonActions() {
        
        getStartedButton.addAction { [weak self] in
            self?.viewModel.getStartedClicked()
        }
        
        signInButton.addAction { [weak self] in
            self?.viewModel.signInClicked()
        }
    }
    
    private func setupViews() {
        
        view.addSubview(collectionView)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(pageControl)
        stackView.addArrangedSubview(getStartedButton)
        stackView.addArrangedSubview(labelStack)
        
        labelStack.addArrangedSubview(alreadySignInLabel)
        labelStack.addArrangedSubview(signInButton)
        
        stackView.setCustomSpacing(40, after: pageControl)
        stackView.setCustomSpacing(26, after: getStartedButton)
        
        labelStack.setCustomSpacing(2, after: alreadySignInLabel)
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20),
            
            
            
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -54),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            getStartedButton.heightAnchor.constraint(equalToConstant: 52),
            getStartedButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            getStartedButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
        ])
        
        getStartedButton.roundCorner(with: 26)
    }
}


// MARK: CollectionView Extensions
extension WalkthroughViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalkthroughScrollCell.identifier, for: indexPath) as? WalkthroughScrollCell else {
            return UICollectionViewCell()
        }
        
        cell.setData(with: scrollItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scrollItems.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }
        
        pageControl.currentPage = indexPath.row
    }
    
}
