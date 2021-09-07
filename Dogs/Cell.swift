//
//  Cell.swift
//  VismaInternship
//
//  Created by Neringa on 03.06.21.
//

import UIKit

class Cell: UICollectionViewCell {
    
    static let reuseidentifier = "cell-reuse-identifier"
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        contentView.addSubview(imageView)
        
        let constrs = [imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                       imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                       imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                       imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)]
        NSLayoutConstraint.activate(constrs)
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    func setImage(image: UIImage?) {
        imageView.image = image
    }
    
    private func imageTapped() {
        print("Image was pressed")
    }
}
