//
//  LocalResourceManager.swift
//  VismaInternship
//
//  Created by Neringa on 01.06.21.
//

import Foundation

struct LocalResourceManager {
    
    func getDogsList(success: (DogsData) -> Void, failure: () -> Void) {
        if let file = Bundle.main.url(forResource: "dog_urls", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: file)
                let jsonDecoder = JSONDecoder()
                let decodedData = try jsonDecoder.decode(DogsData.self, from: data)
                success(decodedData)
            } catch {
                failure()
            }
            
        } else {
            failure()
        }
    }
    
//    func getDogsList2() -> DogsData? {
//        if let file = Bundle.main.url(forResource: "dog_urls", withExtension: "json") {
//
//            do {
//                let data = try Data(contentsOf: file)
//                let jsonDecoder = JSONDecoder()
//                let decodedData = try jsonDecoder.decode(DogsData.self, from: data)
//                return decodedData
//            } catch {
//                return nil
//            }
//
//        } else {
//            return nil
//        }
//    }
}

//paskaityti apie decodinima, kaip paaiskinti 18-27 eilutes?
