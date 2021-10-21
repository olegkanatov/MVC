//
//  NetworkService.swift
//  MVC-N
//
//  Created by Oleg Kanatov on 21.10.21.
//

import Foundation

class NetworkService {
    
    private init() {}
    static let shared = NetworkService()
    
    public func getData(url: URL, complition: @escaping (Any) -> ()) {
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, responce, error in
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    complition(json)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
