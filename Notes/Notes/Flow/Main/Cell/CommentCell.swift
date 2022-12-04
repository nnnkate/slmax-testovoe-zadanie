//
//  CommentCell.swift
//  Notes
//
//  Created by Ekaterina Nedelko on 3.12.22.
//

import UIKit

final class CommentCell: UITableViewCell {
    
    // - Register Cell
    static let reuseID = "CommentCell"
    static func nib() -> UINib {
        return UINib(nibName: "CommentCell",
                     bundle: nil)
    }
        
}
