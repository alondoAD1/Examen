//
//  EntityPrincipal.swift
//  newExamen
//
//  Created by A on 21/01/22.
//

import Foundation

// Models

class ModelColors: NSObject {
    var uno: String?
    var dos: String?
    var tres: String?
    var cuatro: String?
    var cinco: String?
    var seis: String?
    var siete: String?
    
    init(diccionario: [String: AnyObject]){
        super.init()
        
        uno = diccionario["uno"] as? String
        dos = diccionario["dos"] as? String
        tres = diccionario["tres"] as? String
        cuatro = diccionario["cuatro"] as? String
        cinco = diccionario["cinco"] as? String
        seis = diccionario["seis"] as? String
        siete = diccionario["siete"] as? String
        
    }
    
}

