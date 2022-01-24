//
//  GraficasInteractor.swift
//  newExamen
//
//  Created by A on 23/01/22.
//

import FirebaseDatabase

protocol GraficasInteractorProtocol {
    var presenter: GraficasPresenterProtocol? { get set }
    func getQuestions()
}

class GraficasInteractor: GraficasInteractorProtocol {
    
    var presenter: GraficasPresenterProtocol?
    
    func getQuestions() {
        guard let url = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld") else { return }
        URLSession.shared.dataTask(with: url) { (data, req, error) in
            guard let data = data, error == nil else {
                self.presenter?.interactorFechQuestions(with: .failure(FetchError.failed), with: .failure(FetchError.failed))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(QuestResult.self, from: data)
                self.presenter?.interactorFechQuestions(with: .success(result.questions[0].chartData), with: .success(result.questions[1].chartData))
                } catch { self.presenter?.interactorFechQuestions(with: .failure(FetchError.failed), with: .failure(FetchError.failed))
            }

            }.resume()

    }
    

}
