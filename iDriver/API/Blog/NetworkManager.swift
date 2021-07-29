//
//  NetworkManager.swift
//  iDriver
//
//  Created by Ako Kobaidze on 19.07.21.
//

import Foundation
import UIKit

struct Endpoints {
    static var blog = "https://www.myauto.ge/ka/main/getblognews"
    static var part = "https://run.mocky.io/v3/a4fa432c-307d-41d0-b8d8-6eb62c5f7387"
}

class NetworkManager {
    func fetchBlog(url: String, completion: @escaping (Result<[Blog], Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("error happened \(error)")
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let allNews = try JSONDecoder().decode(BlogData.self, from: data)
                    completion(.success(allNews.Data))
                }
                catch {
                    print(error)
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func fetchParts(url: String, completion: @escaping (Result<[Part], Error>) -> Void) {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) {data, response, error in
                if let error = error {
                    print("error happened \(error)")
                    completion(.failure(error))
                }
                
                if let data = data {
                    do {
                        let part = try JSONDecoder().decode([Part].self, from: data)
                        completion(.success(part))
                    }
                    catch {
                        print(error)
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
}

