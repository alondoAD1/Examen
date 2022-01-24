//
//  Interactor.swift
//  newExamen
//
//  Created by A on 21/01/22.
//

import FirebaseDatabase

// Objeto
// Portocolo
// Referencia a Presenter

// JSON

protocol InteractorPrincipalProtocol {
    var presenter: PresenterPrincipalProtocol? { get set }
    func getColors()
}

class InteractorPrincipal: InteractorPrincipalProtocol {
    var presenter: PresenterPrincipalProtocol?
        
    func getColors() {
        let usereferencia = Database.database().reference()
        usereferencia.observeSingleEvent(of: .value, with: { [self] (snapshotUser) in
            for datoSnap in snapshotUser.children.allObjects as![DataSnapshot]{
                let usersObject = datoSnap.value as? [String: AnyObject]
                let colores = ModelColors(diccionario: usersObject!)
                self.presenter?.interactorFechQuestions(with: .success([colores]))
            }
                        
        }, withCancel: nil)

    }
    
    
}
