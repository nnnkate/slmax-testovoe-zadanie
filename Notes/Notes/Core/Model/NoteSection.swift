//
//  NoteSection.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 3.12.22.
//

import Foundation

final class NoteSection {
    
    var note: Note
    var isSelected: Bool
   
    init(note: Note, isSelected: Bool = false) {
        self.note = note
        self.isSelected = isSelected
    }
    
}
