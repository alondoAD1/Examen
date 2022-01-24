//
//  ViewPrincipalUI.swift
//  newExamen
//
//  Created by A on 21/01/22.
//

import Foundation
import UIKit

class ViewPrincipalUI: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CellRespuesta1.self, forCellReuseIdentifier: "CellRespuesta1")
        tableView.register(CellDescripcion.self, forCellReuseIdentifier: "CellDescripcion")
        tableView.register(CellTomarFoto.self, forCellReuseIdentifier: "CellTomarFoto")
        tableView.register(CellEnviarStorage.self, forCellReuseIdentifier: "CellEnviarStorage")
        tableView.register(CellColors.self, forCellReuseIdentifier: "CellColors")

        tableView.separatorStyle = .none
        tableView.isHidden = true
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.bounces = true
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    func LayoutConstraint(view: UIView) {
        view.addSubview(tableView)
                
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    
        ])
    }

    
}

