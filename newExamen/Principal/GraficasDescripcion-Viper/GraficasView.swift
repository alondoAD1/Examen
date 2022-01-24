//
//  GraficasView.swift
//  newExamen
//
//  Created by A on 23/01/22.
//

import Foundation
import UIKit
import Charts

protocol GraficasViewProtocol {
    var presenter: GraficasPresenterProtocol? { get set }
    func update(with datos: [ChartData], with datos2: [ChartData])
    func update(with error: String)
}

class GraficasView: UIViewController, GraficasViewProtocol, ChartViewDelegate {
    
    var presenter: GraficasPresenterProtocol?
    var ui = GraficasViewUI()
    var grafica: [ChartData] = []
    var dataEntries: [PieChartDataEntry] = []
    var dataEntries2: [PieChartDataEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        ui.LayoutConstraint(view: self.view)
    }
    

    func update(with datos: [ChartData], with datos2: [ChartData]) {
        //
        DispatchQueue.main.async { [weak self] in
            for i in 0 ..< datos.count { self?.setCharts(chartData: datos, row: i) }
            for j in 0 ..< datos2.count { self?.setCharts2(chartData: datos2, row: j) }
            self?.ui.pieChartView.isHidden = false
            self?.ui.pieChartView2.isHidden = false
        }

    }
    
    func update(with error: String) {
        //
    }
    
    func setCharts(chartData: [ChartData], row : Int) {

        let dataEntry = PieChartDataEntry(value: Double(chartData[row].percetnage), label: "\(chartData[row].text) \(chartData[row].percetnage)%")
        self.dataEntries.append(dataEntry)

        let pieChartDataSet = PieChartDataSet(entries: self.dataEntries, label: "")
        pieChartDataSet.sliceSpace = 3
        pieChartDataSet.selectionShift = 5

        var colors: [UIColor] = []

        for _ in 0..<chartData.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))

            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }

        pieChartDataSet.colors = colors

        let pieChartData = PieChartData(dataSet: pieChartDataSet)

        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = "%"
        pieChartData.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))

        pieChartData.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 20)!)
        pieChartData.setValueTextColor( .clear)

        let myAttrString = NSAttributedString(string: "Grafica 1", attributes: nil)
        self.ui.pieChartView.centerAttributedText = myAttrString
        self.ui.pieChartView.data = pieChartData
        self.ui.pieChartView.setNeedsDisplay()
        self.ui.pieChartView.animate(xAxisDuration: 2.0, easingOption: .easeOutElastic)

        let d = Description()
        d.text = "\nEstaba limpia la sucursal?"
        d.font = UIFont(name: "HelveticaNeue-Light", size: 15)!
        self.ui.pieChartView.chartDescription = d
//        self.ui.pieChartView.centerText = "Grafica 2"
        self.ui.pieChartView.holeRadiusPercent = 0.9


    }

    func setCharts2(chartData: [ChartData], row : Int) {

        let dataEntry = PieChartDataEntry(value: Double(chartData[row].percetnage), label: "\(chartData[row].text) \(chartData[row].percetnage)%")
        self.dataEntries2.append(dataEntry)

        let pieChartDataSet = PieChartDataSet(entries: self.dataEntries2, label: "")
        pieChartDataSet.sliceSpace = 0
        pieChartDataSet.selectionShift = 4
//        pieChartDataSet.entryLabelFont = UIFont(name: "HelveticaNeue-Light", size: 20)

        var colors: [UIColor] = []

        let pieChartData = PieChartData(dataSet: pieChartDataSet)

        for _ in 0..<chartData.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))

            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }

        pieChartDataSet.colors = colors


        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = "%"
        pieChartData.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))

        pieChartData.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 20)!)
        pieChartData.setValueTextColor( .clear)

//        let myAttrString = NSAttributedString(string: "Grafica 2", attributes: nil)
//        self.ui.pieChartView2.centerAttributedText = myAttrString
        self.ui.pieChartView2.data = pieChartData
        self.ui.pieChartView2.setNeedsDisplay()
        self.ui.pieChartView2.animate(xAxisDuration: 2.0, easingOption: .easeOutElastic)

        let d = Description()
        d.text = "\nQue empresas cuentan con medida de seguridad?"
        d.font = UIFont(name: "HelveticaNeue-Light", size: 10)!
        self.ui.pieChartView2.chartDescription = d
//        self.ui.pieChartView2.holeRadiusPercent = 0.3

    }

        

}
