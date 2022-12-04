//
//  NoteView.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 3.12.22.
//

import UIKit
import SnapKit

protocol NoteViewDelegate: AnyObject {
    func didSelectNote() 
}

final class NoteView: UIView {
    
    // - UI
    private let titleLabel: UILabel = {
        let label = UILabel()
//        label.font =
        return label
    }()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
//        label.font =
        return label
    }()
    private let separator: UIView = {
        let view = UILabel()
        view.backgroundColor = .black
        return view
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.image = UIImage(named: "chevron.down")
        imageView.image = UIImage(named: "chevron.up")
        return imageView
    }()
    
    // - Data
    private var noteSection: NoteSection?
    
    // - Delegate
    weak var delegate: NoteViewDelegate?
    
    // - LifeCycle
    init() {
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
}

// MARK: - Set
extension NoteView {
    
    func set(noteSection: NoteSection) {
        self.noteSection = noteSection
    }
    
}

// MARK: - Configure
private extension NoteView {
    
    func configure() {
        addSubviews()
        makeConstraints()
    }
    
    func addSubviews() {
        addSubview(titleLabel)
    }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(17)
            $0.top.equalTo(10)
            $0.bottom.equalTo(-10)
        }
    }
    
}
