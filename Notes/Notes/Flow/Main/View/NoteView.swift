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
    func deleteNote(index: Int)
}

final class NoteView: UIView {
    
    // - UI
    private let mainView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Raleway-SemiBold", size: 14)
        label.textColor = .black
        return label
    }()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Raleway-Light", size: 8)
        label.textColor = .black
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
        imageView.image = UIImage(named: "arrow_down")
        return imageView
    }()
    
    // - Data
    private var note: Note?
    
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
    
    func set(note: Note) {
        self.note = note
        titleLabel.text = note.title
        subtitleLabel.text = note.subtitle
    }
    
}

// MARK: - Action
extension NoteView {
    
    @objc func handleTap() {
        guard let note else { return }
        note.isSelected.toggle()
        let imageName = note.isSelected ? "arrow_up" : "arrow_down"
        imageView.image = UIImage(named: imageName)
        delegate?.didSelectNote()
    }
    
}

// MARK: - Configure
private extension NoteView {
    
    func configure() {
        configureMainView()
        addSubviews()
        makeConstraints()
    }
    
    func configureMainView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        mainView.addGestureRecognizer(tap)
    }
    
    func addSubviews() {
        addSubview(mainView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(separator)
        mainView.addSubview(subtitleLabel)
        mainView.addSubview(imageView)
    }
    
    func makeConstraints() {
        mainView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(17)
            $0.width.equalTo(70)
            $0.top.equalTo(10)
            $0.bottom.equalTo(-10)
            $0.trailing.equalTo(separator.snp.leading).offset(-7)
        }
        
        separator.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.top.equalTo(10)
            $0.bottom.equalTo(-10)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.leading.equalTo(separator.snp.trailing).offset(7)
            $0.top.equalTo(13)
            $0.bottom.equalTo(-13)
            $0.trailing.equalTo(imageView.snp.leading).offset(-7)
        }
        
        imageView.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(7)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(-13)
            $0.width.height.equalTo(25)
        }
    }
    
}
