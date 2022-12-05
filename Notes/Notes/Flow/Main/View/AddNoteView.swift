//
//  AddNoteView.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 4.12.22.
//

import UIKit
import SnapKit

protocol AddNoteViewDelegate: AnyObject {
    func addNote(newNote: Note)
}

final class AddNoteView: UIView {
    
    // - UI
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Название"
        textField.font = UIFont(name: "Raleway-SemiBold", size: 14)
        textField.textColor = .black
        return textField
    }()
    private let subtitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Текст описание"
        textField.font = UIFont(name: "Raleway-Light", size: 10)
        textField.textColor = .black
        return textField
    }()
    private let separator: UIView = {
        let view = UILabel()
        view.backgroundColor = .lightGray
        return view
    }()
    private let addButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(named: "arrow_right"), for: .normal)
        button.addTarget(AddNoteView.self, action: #selector(addNote), for: .touchUpInside)
        return button
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

// MARK: - Action
private extension AddNoteView {
    
    @objc func addNote() {
        // TODO: if text is empty
        let newNote = Note(id: UUID().uuidString,
                           title: titleTextField.text ?? "",
                           subtitle: subtitleTextField.text ?? "",
                           date: Date())
        delegate?.addNote(newNote: newNote)
        titleTextField.text = ""
        subtitleTextField.text = ""
    }
    
}

// MARK: - UITextFieldDelegate
extension AddNoteView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(string == "\n") {
            titleTextField.resignFirstResponder()
            return false
        }
        let maxLength = 25
        let currentString: NSString = titleTextField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
}

// MARK: - Configure
private extension AddNoteView {
    
    func configure() {
        configureUI()
        configureTitleTextField()
        addSubviews()
        makeConstraints()
    }
    
    func configureUI() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.layer.cornerRadius = 10
    }
    
    func configureTitleTextField() {
        titleTextField.delegate = self
    }
    
    func addSubviews() {
        addSubview(titleTextField)
        addSubview(subtitleTextField)
        addSubview(separator)
        addSubview(addButton)
    }
    
    func makeConstraints() {
        titleTextField.snp.makeConstraints {
            $0.leading.equalTo(21)
            $0.trailing.equalTo(-27)
            $0.top.equalTo(17)
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(7)
            $0.height.equalTo(1)
            $0.leading.equalTo(17)
            $0.trailing.equalTo(-27)
        }
        
        subtitleTextField.snp.makeConstraints {
            $0.top.equalTo(separator.snp.bottom).offset(11)
            $0.leading.equalTo(21)
            $0.bottom.equalTo(-19)
            $0.trailing.equalTo(addButton.snp.leading).offset(-4)
        }
        
        addButton.snp.makeConstraints {
            $0.top.equalTo(separator.snp.bottom).offset(4)
            $0.trailing.equalTo(-19)
            $0.width.height.equalTo(24)
        }
    }
    
}
