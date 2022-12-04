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
    private(set) lazy var noteSections: [NoteSection] = []
    private lazy var notes: [Note] = []
    
    // - Manager
    private let databaseManager = NoteDatabaseManager()
    
    // - Delegate
    private weak var delegate: MainPresenterDelegate?
    
    init(delegate: MainPresenterDelegate?) {
        self.delegate = delegate
    }
   
}

// MARK: - Database
private extension MainPresenter {
    
    func getNotes() {
        notes = databaseManager.notes.map { Note.fromDb(realm: $0) }
        delegate?.reloadData()
    }
    
    func saveNote() {
        databaseManager.rewrite(notes.map { NoteRealm.fromDto(dto: $0) })
    }
}
