//
//  NoteRealm.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 3.12.22.
//

import Foundation
import RealmSwift

class NoteRealm: Object {
    
    @Persisted(primaryKey: true) var primarykeyId: String = ""
    @Persisted var title: String = ""
    @Persisted var subtitle: String = ""
    @Persisted var date: Date?
    
    static func fromDto(dto: Note) -> NoteRealm {
        let noteRealm = NoteRealm()
        noteRealm.primarykeyId = dto.id
        noteRealm.title = dto.title
        noteRealm.subtitle = dto.subtitle
        return noteRealm
    }
    
}

