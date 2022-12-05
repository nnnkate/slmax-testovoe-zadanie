//
//  MainViewController.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 3.12.22.
//

import UIKit

final class MainViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var addNoteView: AddNoteView!
    
    // - DataSource
    private(set) var dataSource: MainDataSource?
    
    // - ViewModel
    private lazy var presenter = MainPresenter(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}

// MARK: - MainPresenterDelegate
extension MainViewController: MainPresenterDelegate {
    
    func reloadData() {
        dataSource?.set(notes: presenter.notes)
        notesTableView.reloadData()
    }
    
}

// MARK: - NoteViewDelegate
extension MainViewController: NoteViewDelegate {
   
    func deleteNote(index: Int) {
        presenter.deleteNote(index: index)
    }
    
    func didSelectNote() {
        reloadData()
    }
    
}

// MARK: - AddNoteViewDelegate
extension MainViewController: AddNoteViewDelegate {
    
    func addNote(newNote: Note) {
        presenter.addNote(newNote: newNote)
    }
  
}

// MARK: - Configure
extension MainViewController {
    
    func configure() {
        configureAddNoteView()
        configureDataSource()
        configureUI()
        presenter.getNotes()
    }
    
    func configureAddNoteView() {
        addNoteView.delegate = self
    }
    
    func configureDataSource() {
        dataSource = MainDataSource(tableView: notesTableView)
        dataSource?.delegate = self
    }
    
    func configureUI() {
        titleLabel.font = UIFont(name: "Raleway-SemiBold", size: 28)
    }
    
}

