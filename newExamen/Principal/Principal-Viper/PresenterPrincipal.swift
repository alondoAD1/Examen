//
//  PresenterPrincipal.swift
//  newExamen
//
//  Created by A on 21/01/22.
//

import Foundation

// Objeto
// Protocolos
// Referencia Presenter, router, view

enum FetchError: Error {
    case failed
}

protocol PresenterPrincipalProtocol {
    var router: RouterPrincipalProtocol? { get set }
    var interactor: InteractorPrincipalProtocol? { get set }
    var view: ViewPrincipalProtocol? { get set }
    func interactorFechQuestions(with result: Result<[ModelColors], Error>)

}

class PresenterPrincipal: PresenterPrincipalProtocol {
    
    
    var router: RouterPrincipalProtocol?
    var view: ViewPrincipalProtocol?
    var interactor: InteractorPrincipalProtocol? {
        didSet {
            interactor?.getColors()
        }
    }
    
    
    func interactorFechQuestions(with result: Result<[ModelColors], Error>) {
        switch result {
        case .success(let datos):
            view?.update(with: datos)
        case .failure:
            view?.update(with: "error")
        }
    }

}
