//
//  CellTomarFotoUI.swift
//  newExamen
//
//  Created by A on 22/01/22.
//

import UIKit

class CellTomarFotoUI: UITableViewCell {

    lazy var imageViewTomarSelfie: UIImageView = {
        let item = UIImageView()
        item.backgroundColor = UIColor(named: "colorFondo")
        item.layer.cornerRadius = 20
        item.clipsToBounds = true
        item.isUserInteractionEnabled = true
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    lazy var button: UILabel = {
        let item = UILabel()
        item.text = "Tomar / Seleccionar"
        item.textColor = .systemBlue
        item.isUserInteractionEnabled = true
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()

}
