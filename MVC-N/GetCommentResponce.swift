//
//  GetCommentResponce.swift
//  MVC-N
//
//  Created by Oleg Kanatov on 21.10.21.
//

import Foundation

struct GetCommentResponce {
    
    typealias JSON = [String: AnyObject]
    let comments: [Comment]
    
    init(json: Any) throws {
        guard let array = json as? [JSON] else { throw NetworkError.failInternetError }
        
        var comments = [Comment]()
        for dictionary in array {
            guard let comment = Comment(dict: dictionary) else { continue }
            comments.append(comment)
        }
        self.comments = comments
    }
}
