//
//  ViewModel.swift
//  VismaInternship
//
//  Created by Neringa on 02.06.21.
//

import UIKit

protocol ViewModelDelegate: AnyObject {
    func open(viewController: UIViewController)
}

class ViewModel: NSObject {
    
    private let model: DataModel
    private var dogs: [DogViewModelItem] = []
    weak var delegate: ViewModelDelegate?
    
    init(with model: DataModel){
        self.model = model
    }

    func getDogsList(success: () -> Void, failure: () -> Void) {
        model.getDogsList { (array: [DogViewModelItem]) in
            dogs = array
            
        } failure: {
            failure()
        }
    }
}

extension ViewModel: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dog = dogs[indexPath.item]
        guard let image = dog.image else { return }
        let vc = PreviewViewController(with: image)
        delegate?.open(viewController: vc)
    }
}

extension ViewModel: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseidentifier, for: indexPath) as? Cell else {
            fatalError("dequeud wrong cell type")
        }
        
        cell.backgroundColor = .gray
        
        let dog = dogs[indexPath.item]
        
        if let image = dog.image {
            cell.setImage(image: image)
        
        } else {
            let url = dog.url
            model.getImage(urlString: url) { (image: UIImage) in
                dog.image = image
                cell.setImage(image: image)
                
            } failure: {
                //
            }
        }        
        return cell
    }
}

