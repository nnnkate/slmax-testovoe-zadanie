//
//  CommentRealm.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 3.12.22.
//

import Foundation
import RealmSwift

class CommentRealm: Object {
    
    @Persisted(primaryKey: true) var primarykeyId: String = ""
    @Persisted var noteId: String = ""
    @Persisted var title: String = ""
    @Persisted var text: String = ""
    @Persisted var date: Date?
    
    static func fromDto(dto: Comment) -> CommentRealm {
        let commentRealm = CommentRealm()
        commentRealm.primarykeyId = dto.id
        commentRealm.noteId = dto.noteId
        commentRealm.title = dto.title
        commentRealm.text = dto.text
        commentRealm.date = dto.date
        return commentRealm
    }
    
}

