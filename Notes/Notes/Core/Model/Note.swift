//
//  Note.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 3.12.22.
//

import Foundation

final class Note {
   
    var id: String = ""
    var title: String = ""
    var subtitle: String = ""
    var date: Date?
    var comments: [Comment] = []
    var isSelected: Bool =  false
    
    init() {}
    
    init(id: String, title: String, subtitle: String, date: Date?, comments: [Comment] = []) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.date = date
        self.comments = comments
    }
    
    static func fromDb(realm: NoteRealm?, commentsRealm: [CommentRealm] = []) -> Note {
        let note = Note()
        note.id = realm?.primarykeyId ?? ""
        note.title = realm?.title ?? ""
        note.subtitle = realm?.subtitle ?? ""
        note.date = realm?.date
        note.comments = commentsRealm.map { Comment.fromDb(realm: $0) }
        return note
    }
    
}
