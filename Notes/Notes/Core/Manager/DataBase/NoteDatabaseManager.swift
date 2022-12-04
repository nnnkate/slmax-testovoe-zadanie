//
//  NoteDatabaseManager.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 3.12.22.
//

import Foundation
import RealmSwift

class NoteDatabaseManager: NSObject {
    
    // - Realm
    private var realm = try! Realm()
    
    var notes: Results<NoteRealm> {
        return realm.objects(NoteRealm.self)
    }
    
    func getNoteById(id: String) -> NoteRealm? {
        return realm.object(ofType: NoteRealm.self, forPrimaryKey: id)
    }
    
   func rewrite(_ array: [NoteRealm]) {
        try? self.realm.write { [weak self] in
            let oldItems = notes.filter({ r in !array.contains(where: { $0.primarykeyId == r.primarykeyId })})
            self?.realm.delete(oldItems)
            self?.realm.add(array, update: .all)
        }
    }
    
    func save(_ array: [NoteRealm]) {
        try? self.realm.write { [weak self] in
            self?.realm.add(array, update: .all)
        }
    }
    
    func delete(id: String?) {
        guard let note = getNoteById(id: id ?? "") else { return }
        try! realm.write {
            realm.delete(note)
        }
    }
    
    func clear() {
        try! realm.write {
            realm.delete(notes)
        }
    }
    
}
