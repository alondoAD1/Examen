//
//  ViewPrincipal.swift
//  newExamen
//
//  Created by A on 21/01/22.
//

import FirebaseDatabase
import UIKit

// ViewControllers
// Protocolos
// Referencia Presenter

protocol ViewPrincipalProtocol {
    var presenter: PresenterPrincipalProtocol? { get set }
    func update(with colores: [ModelColors])
    func update(with error: String)
}

class ViewPrincipal: UIViewController, ViewPrincipalProtocol, UITableViewDataSource, UITableViewDelegate {
    
    var presenter: PresenterPrincipalProtocol?
    var ui = ViewPrincipalUI()
    var grafica: [ChartData] = []
//    var colors: [ModelColors] = []
    var colores: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Examen"
        ui.LayoutConstraint(view: self.view)
        ui.tableView.delegate = self
        ui.tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTomarFoto", for: indexPath) as! CellTomarFoto
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellDescripcion", for: indexPath)
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellColors", for: indexPath) as! CellColors
            cell.selectionStyle = .none
            cell.backgroundColor = .clear

            if self.colores.count > 0 {
                for i in 0..<colores.count {
                    let button = UIButton(type: .custom)
                    button.layer.cornerRadius = 20
                    button.clipsToBounds = true
                    button.backgroundColor = UIColor(hexString: colores[i])
                    button.setTitle("\(colores[i])", for: .normal)
                    button.setTitleColor(UIColor(hexString: colores[i]), for: .normal)
                    button.addTarget(self, action: #selector(loginClicked(sender:)), for: .touchUpInside)
                    button.tag = i
                    button.isUserInteractionEnabled = true
                    cell.ui.stackView.addArrangedSubview(button)
                }

            }
            
            return cell

        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellEnviarStorage", for: indexPath) as! CellEnviarStorage
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            return cell

        default:
            print("default")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellRespuesta1", for: indexPath) as! CellRespuesta1
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell


    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 1:
                let cell =  ui.tableView.cellForRow(at: IndexPath(row: 0, section: 0))! as! CellRespuesta1
                let cellPass =  ui.tableView.cellForRow(at: indexPath)! as! CellTomarFoto
                if cell.ui.textfield.text != "" {
                    cellPass.showPopUp(username: cell.ui.textfield.text!)
                } else {
                    let alert = UIAlertController(title: "Alerta!", message: "Escribe tu nombre", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default) { _ in })
                    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                }
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellDescripcion", for: indexPath)
                cell.selectionStyle = .none
                let router = GraficasRouter.iniciar()
                let vc = router.entry
                self.navigationController?.pushViewController(vc!, animated: true)
            
            case 4:
                let cellText = ui.tableView.cellForRow(at: IndexPath(row: 0, section: 0))! as! CellRespuesta1
                let cellImg =  ui.tableView.cellForRow(at: IndexPath(row: 1, section: 0))! as! CellTomarFoto
                let cellPass = ui.tableView.cellForRow(at: indexPath)! as! CellEnviarStorage
                if cellImg.selecImagePicker != nil {
                    cellPass.showPopUp(username: cellText.ui.textfield.text!, image: cellImg.selecImagePicker!)
                } else {
                    let alert = UIAlertController(title: "Alerta!", message: "Selecciona una imagen primero.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default) { _ in })
                    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                }
            
            default:
                print("default")
        }

    }
    

    func update(with colores: [ModelColors]) {
        //
        DispatchQueue.main.async { [weak self] in
//            self?.grafica = datos
//            self?.colors = colores
            self?.colores = [colores[0].uno!,
                             colores[0].dos!,
                             colores[0].tres!,
                             colores[0].cuatro!,
                             colores[0].cinco!,
                             colores[0].seis!,
                             colores[0].siete!]
            self?.ui.tableView.isHidden = false
            self?.ui.tableView.reloadData()
        }
    }
    
    func update(with error: String) {
        // poner algun view que muestre el error o alguna persistencia de datos
    }
    
    @objc func loginClicked(sender: UIButton) {
        self.view.backgroundColor = UIColor(hexString: (sender.titleLabel?.text)!)
        switch sender.tag {
            case 0:
                print("0")
            case 1:
                print("1")
            case 2:
                print("2")
            case 3:
                print("3")
            case 4:
                print("4")
            case 5:
                print("5")
            case 6:
                print("6")

            default:
                 print("yes")
        }

     }

    
}

