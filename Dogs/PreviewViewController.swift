//
//  DetailViewController.swift
//  VismaInternship
//
//  Created by Neringa on 04.06.21.
//

import UIKit

class PreviewViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.minimumZoomScale = 1
        scroll.maximumZoomScale = 6
        scroll.delegate = self
        return scroll
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let image: UIImage
    
    init(with image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
        imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        let constrs = [scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                       scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                       scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                       scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
                       imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                       imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)]
        NSLayoutConstraint.activate(constrs)
    }
}

extension PreviewViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
