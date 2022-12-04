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
    @IBOutlet weak var topImageVIew: UIImageView!
    @IBOutlet weak var bottomImageVIew: UIImageView!
    @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var createNoteView: UIView!
    
    // - DataSource
    private(set) var dataSource: MainDataSource?
    
    // - ViewModel
    private lazy var presenter = MainPresenter(delegate: self)
    
    override func viewDidLoad() {
        
    }
    
}

extension MainViewController: MainPresenterDelegate {
    
    func reloadData() {
        notesTableView.reloadData()
    }
    
}
