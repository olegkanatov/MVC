//
//  CommentNetworkService.swift
//  MVC-N
//
//  Created by Oleg Kanatov on 21.10.21.
//

import Foundation

class CommentNetworkService {
    private init() {}
    
    static func getComments(completion: @escaping(GetCommentResponce) -> ()) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let responce = try GetCommentResponce(json: json)
                completion(responce)
            } catch {
                print(error)
            }
        }
    }
}
