//
//  GraficasRouter.swift
//  newExamen
//
//  Created by A on 23/01/22.
//

import UIKit

typealias EntryPointGraficas = GraficasViewProtocol & UIViewController
protocol GraficasRouterProtocol {
    var entry: EntryPointGraficas? { get }
    static func iniciar() -> GraficasRouterProtocol
}

class GraficasRouter: GraficasRouterProtocol {
    
    var entry: EntryPointGraficas?
    
    static func iniciar() -> GraficasRouterProtocol {
        let router = GraficasRouter()
        var view: GraficasViewProtocol = GraficasView()
        var presenter: GraficasPresenterProtocol = GraficasPresenter()
        var interactor: GraficasInteractorProtocol = GraficasInteractor()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        router.entry = view as? EntryPointGraficas
        return router
    }
    
}
