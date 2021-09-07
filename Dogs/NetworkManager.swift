//
//  NetworkManager.swift
//  VismaInternship
//
//  Created by Neringa on 02.06.21.
//

import UIKit

struct NetworkManager {

    func getImage(urlString: String?, success: @escaping (UIImage) -> Void, failure: @escaping () -> Void) {
        
        guard let string = urlString, let url = URL(string: string) else {
            failure()
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                DispatchQueue.main.async {
                    failure()
                }
                return
            }
            
            guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
                DispatchQueue.main.async {
                    failure()
                }
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        success(image)
                    }
                }
                
            } else {
                DispatchQueue.main.async {
                    failure()
                }
            }
        }
        
        task.resume()
    }
}
