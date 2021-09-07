//
//  DogsData.swift
//  VismaInternship
//
//  Created by Neringa on 01.06.21.
//

import UIKit

struct DogsData: Codable {
    var urls: [String]
}

class DogViewModelItem {
    let url: String
    var image: UIImage? = nil
    
    init(with url: String, image: UIImage? = nil) {
        self.url = url
        self.image = image
    }
}
