//
//  CellColorsUI.swift
//  newExamen
//
//  Created by A on 22/01/22.
//

import UIKit

class CellColorsUI: UITableViewCell {

    internal lazy var stackView: UIStackView = {
        let item = UIStackView(arrangedSubviews: [])
        item.alignment = .fill
        item.distribution = .fillEqually
        item.spacing = 8.0
        item.isUserInteractionEnabled = true
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    

}
