//
//  DataModel.swift
//  VismaInternship
//
//  Created by Neringa on 02.06.21.
//

import UIKit

struct DataModel {
    
    private let networkManager: NetworkManager
    private let localResourceManager: LocalResourceManager
    
    init (with networkManager: NetworkManager, with localResourceManager: LocalResourceManager) {
        self.networkManager = networkManager
        self.localResourceManager = localResourceManager
    }
    
    func getDogsList(success: ([DogViewModelItem]) -> Void, failure: () -> Void) {
        localResourceManager.getDogsList(success: { (data: DogsData) in
            var result: [DogViewModelItem] = []
            for urlString in data.urls {
                let dogViewModelItem = DogViewModelItem(with: urlString)
                result.append(dogViewModelItem)
            }

            success(result)

        }, failure: failure)
    }

    func getImage(urlString: String, success: @escaping (UIImage) -> Void, failure: @escaping () -> Void){
        networkManager.getImage(urlString: urlString, success: success, failure: failure)
    }
}

//@escaping? tai reiskia, kad pirmiausiai yra atliekmas metodas, o tik tada pradedamas vykdyti blokas:  @escaping
