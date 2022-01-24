//
//  CellColors.swift
//  newExamen
//
//  Created by A on 22/01/22.
//

import UIKit

class CellColors: UITableViewCell {

    var ui = CellColorsUI()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func constraints() {
        self.contentView.addSubview(ui.stackView)
    
        NSLayoutConstraint.activate([
            ui.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            ui.stackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15),
            ui.stackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15),
            ui.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15),
            ui.stackView.heightAnchor.constraint(equalToConstant: 55)
        ])

    }
        
}
