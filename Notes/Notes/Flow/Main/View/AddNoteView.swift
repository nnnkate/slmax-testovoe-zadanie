//
//  AddNoteView.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 4.12.22.
//

import UIKit
import SnapKit

protocol AddNoteViewDelegate: AnyObject {
    
}

final class AddNoteView: UIView {
    
    // - UI
    private let titleTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    private let subtitleTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    private let separator: UIView = {
        let view = UILabel()
        view.backgroundColor = .black
        return view
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.image = UIImage(named: "chevron.forward")
        return imageView
    }()
    
    // - Data
    private var note: Note?
    
    // - Delegate
    weak var delegate: AddNoteViewDelegate?
    
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

// MARK: - Configure
private extension AddNoteView {
    
    func configure() {
        addSubviews()
        makeConstraints()
    }
    
    func addSubviews() {
        addSubview(titleTextField)
        addSubview(subtitleTextField)
        addSubview(separator)
        addSubview(imageView)
    }
    
    func makeConstraints() {
//        titleLabel.snp.makeConstraints {
//            $0.leading.equalTo(17)
//            $0.top.equalTo(10)
//            $0.bottom.equalTo(-10)
//        }
    }
    
}
