//
//  RouterPrincipal.swift
//  newExamen
//
//  Created by A on 21/01/22.
//

import UIKit

// Objeto
// Entry point

typealias EntryPoint = ViewPrincipalProtocol & UIViewController
protocol RouterPrincipalProtocol {
    var entry: EntryPoint? { get }
    static func iniciar() -> RouterPrincipalProtocol
}

class RouterPrincipal: RouterPrincipalProtocol {
    
    var entry: EntryPoint?
    
    static func iniciar() -> RouterPrincipalProtocol {
        let router = RouterPrincipal()
        var view: ViewPrincipalProtocol = ViewPrincipal()
        var presenter: PresenterPrincipalProtocol = PresenterPrincipal()
        var interactor: InteractorPrincipalProtocol = InteractorPrincipal()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        router.entry = view as? EntryPoint 
        return router
    }
    
}
