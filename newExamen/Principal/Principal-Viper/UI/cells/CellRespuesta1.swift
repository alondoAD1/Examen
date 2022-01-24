//
//  CellRespuesta1.swift
//  newExamen
//
//  Created by A on 22/01/22.
//

import Foundation
import UIKit


class CellRespuesta1: UITableViewCell, UITextFieldDelegate {

    var ui = CellRespuesta1UI()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        ui.textfield.delegate = self
        constraints()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ui.textfield.resignFirstResponder()
        return true
    }

    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == ui.textfield {
                    let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
                    let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
                    let typedCharacterSet = CharacterSet(charactersIn: string)
                    let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
                    return alphabet
          } else { return false }
    }

    func constraints() {
        self.contentView.addSubview(ui.textfield)
        NSLayoutConstraint.activate([
            ui.textfield.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            ui.textfield.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15),
            ui.textfield.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15),
            ui.textfield.heightAnchor.constraint(equalToConstant: 40),
            ui.textfield.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
        
    }
    
}
