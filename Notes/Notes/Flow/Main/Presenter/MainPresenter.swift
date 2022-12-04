//
//  MainPresenter.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 3.12.22.
//

import Foundation

protocol MainPresenterDelegate: AnyObject {
    func reloadData()
}

final class MainPresenter {
    
    // - Data
    private(set) lazy var notes: [Note] = []
    
    // - Manager
    private let databaseManager = NoteDatabaseManager()
    
    // - Delegate
    private weak var delegate: MainPresenterDelegate?
    
    init(delegate: MainPresenterDelegate?) {
        self.delegate = delegate
    }
   
}

// MARK: - Database
extension MainPresenter {
    
    func getNotes() {
        notes = databaseManager.notes.map { Note.fromDb(realm: $0) }
        notes = [Note(id: "1", title: "Note 1", subtitle: "Text 1", date: Date(), comments: []),
                 Note(id: "2", title: "Note 2", subtitle: "Text 2", date: Date(), comments: []),
                 Note(id: "3", title: "Note 3", subtitle: "Text 3", date: Date(), comments: [])] // - for test
        delegate?.reloadData()
    }
    
    func saveNote() {
        databaseManager.rewrite(notes.map { NoteRealm.fromDto(dto: $0) })
    }
    
}
