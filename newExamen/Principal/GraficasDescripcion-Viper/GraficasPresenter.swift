//
//  GraficasPresenter.swift
//  newExamen
//
//  Created by A on 23/01/22.
//

import Foundation


protocol GraficasPresenterProtocol {
    var router: GraficasRouterProtocol? { get set }
    var interactor: GraficasInteractorProtocol? { get set }
    var view: GraficasViewProtocol? { get set }
    func interactorFechQuestions(with result: Result<[ChartData], Error>, with result2: Result<[ChartData], Error>)

}

class GraficasPresenter: GraficasPresenterProtocol {
    
    var router: GraficasRouterProtocol?
    
    var interactor: GraficasInteractorProtocol? {
        didSet {
            interactor?.getQuestions()
        }
    }
    var view: GraficasViewProtocol?
    
    func interactorFechQuestions(with result: Result<[ChartData], Error>, with result2: Result<[ChartData], Error>) {
        
        switch result {
        case .success(let datos):
            
            switch result2 {
            case .success(let datos2):
                view?.update(with: datos, with: datos2)
            case .failure:
                view?.update(with: "error")
            }
            
        case .failure:
            view?.update(with: "error")
        }

    }
    
    
}
