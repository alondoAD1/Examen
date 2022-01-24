//
//  CellDescripcionUI.swift
//  newExamen
//
//  Created by A on 22/01/22.
//

import UIKit

class CellDescripcionUI: UITableViewCell {
    
    lazy var textfield: UILabel = {
        let item = UILabel()
        item.lineBreakMode = .byWordWrapping
        item.numberOfLines = 0
        item.textAlignment = .justified
        item.text = "Descripción: \n\nUna gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental)."
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    

}
