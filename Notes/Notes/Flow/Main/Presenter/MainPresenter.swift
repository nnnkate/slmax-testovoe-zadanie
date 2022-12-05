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

// MARK: - Action
extension MainPresenter {
    
    func addNote(newNote: Note) {
        notes.append(newNote)
        saveNotes()
        delegate?.reloadData()
    }
    
    func deleteNote(index: Int) {
        notes.remove(at: index)
    }
    
}


// MARK: - Database
extension MainPresenter {
    
    func getNotes() {
        notes = databaseManager.notes.map { Note.fromDb(realm: $0) }
        delegate?.reloadData()
    }
    
    private func saveNotes() {
        databaseManager.rewrite(notes.map { NoteRealm.fromDto(dto: $0) })
    }
    
}
