//
//  GraficasViewUI.swift
//  newExamen
//
//  Created by A on 23/01/22.
//

import UIKit
import Charts

class GraficasViewUI: UIViewController {
    
    let pieChartView = PieChartView()
    let pieChartView2 = PieChartView()

    lazy var pieChart: UIView = {
        var item = UIView()
        item = pieChartView
        item.isHidden = true
        item.backgroundColor = .clear
        item.layer.cornerRadius = 20
        item.clipsToBounds = true
        item.isUserInteractionEnabled = true
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    lazy var pieChart2: UIView = {
        var item = UIView()
        item = pieChartView2
        item.isHidden = true
        item.backgroundColor = .clear
        item.layer.cornerRadius = 20
        item.clipsToBounds = true
        item.isUserInteractionEnabled = true
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    func LayoutConstraint(view: UIView) {
        view.addSubview(pieChart)
        view.addSubview(pieChart2)

        NSLayoutConstraint.activate([
            pieChart.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            pieChart.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            pieChart.heightAnchor.constraint(equalToConstant: 300),
            pieChart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            pieChart2.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            pieChart2.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            pieChart2.heightAnchor.constraint(equalToConstant: 300),
            pieChart2.topAnchor.constraint(equalTo: pieChart.bottomAnchor, constant: 20),

            
        ])

    }

}
