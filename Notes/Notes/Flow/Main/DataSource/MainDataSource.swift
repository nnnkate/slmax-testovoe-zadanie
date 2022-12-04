//
//  MainDataSource.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 3.12.22.
//

import UIKit

class MainDataSource: NSObject {
    
    // - Init
    private unowned let tableView: UITableView
    
    // - Data
    private var noteSections: [NoteSection]
    
    // - Delegate
//    weak var delegate: Delegate?
    
    // - Lifecycle
    init(tableView: UITableView, noteSections: [NoteSection]) {
        self.tableView = tableView
        self.noteSections = noteSections
        super.init()
        configure()
    }
    
}

// MARK: - UITableView Data Source
extension MainDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return noteSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        noteSections[section].note.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        commentCell(cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let noteView = NoteView()
        noteView.set(noteSection: noteSections[section])
        return noteView
    }
    
}
    
    
// MARK: - Cell
private extension MainDataSource {
    
        func commentCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.reuseID, for: indexPath) as! CommentCell
            return cell
        }
    
}

// MARK: - UITableView Delegate
extension MainDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

// MARK: - Configure
private extension MainDataSource {
    
    func configure() {
        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 141
        registerCells()
        setupDataSource()
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }
    
    func setupDataSource() {
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.contentInset = .init(top: 0, left: 0, bottom: 20, right: 0)
    }
    
    func registerCells() {
        tableView.register(CommentCell.nib(), forCellReuseIdentifier: CommentCell.reuseID)
    }
    
}
