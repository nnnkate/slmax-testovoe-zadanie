//
//  Comment.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 3.12.22.
//

import Foundation

final class Comment {
   
    var id: String = ""
    var noteId: String = ""
    var title: String = ""
    var text: String = ""
    var date: Date?
    
    init() {}
    
    static func fromDb(realm: CommentRealm?) -> Comment {
        let comment = Comment()
        comment.id = realm?.primarykeyId ?? ""
        comment.noteId = realm?.noteId ?? ""
        comment.title = realm?.title ?? ""
        comment.text = realm?.text ?? ""
        comment.date = realm?.date
        return comment
    }
    
}
