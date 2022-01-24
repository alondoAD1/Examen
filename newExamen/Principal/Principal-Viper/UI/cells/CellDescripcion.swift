//
//  CellDescripcion.swift
//  newExamen
//
//  Created by A on 22/01/22.
//

import UIKit

class CellDescripcion: UITableViewCell {

    var ui = CellDescripcionUI()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints() {
        self.contentView.addSubview(ui.textfield)
        NSLayoutConstraint.activate([
            ui.textfield.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            ui.textfield.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            ui.textfield.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10),
            ui.textfield.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),

        ])
        
    }

}
