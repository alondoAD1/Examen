//
//  CellRespuesta1UI.swift
//  newExamen
//
//  Created by A on 22/01/22.
//

import Foundation
import UIKit

class CellRespuesta1UI: UITableViewCell {
    
    lazy var textfield: UITextField = {
        let item = UITextField()
        item.placeholder = "Escribe tu nombre"
        item.borderStyle = .roundedRect
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()


}
