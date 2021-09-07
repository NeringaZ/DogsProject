//
//  ViewController.swift
//  VismaInternship
//
//  Created by Neringa on 01.06.21.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.32), heightDimension: .absolute(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        group.interItemSpacing = .fixed(16)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseidentifier)
        view.dataSource = viewModel
        view.delegate = viewModel
        
        return view
    }()
    
    private let viewModel: ViewModel
    
    init(with model: ViewModel) {
        viewModel = model
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        let constrs = [collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                       collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                       collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                       collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        NSLayoutConstraint.activate(constrs)
     
        //57 eilute reikalinga tam, kad
        viewModel.getDogsList {
//            collectionView.reloadData()

        } failure: {
            // handle failure
        }
    }
}

extension ViewController: ViewModelDelegate {
    
    func open(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
