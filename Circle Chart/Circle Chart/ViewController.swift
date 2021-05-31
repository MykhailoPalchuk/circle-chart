//
//  ViewController.swift
//  Circle Chart
//
//  Created by Mykhailo Palchuk on 5/30/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCircleChart()
    }


    private func configureCircleChart() {
        let chart = CircleChartView(sectors: [
            CircleChartView.Sector(part: 0.3, color: .blue),
            CircleChartView.Sector(part: 0.4, color: .green),
            CircleChartView.Sector(part: 0.1, color: .red),
            CircleChartView.Sector(part: 0.2, color: .yellow)
        ])
        chart.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chart)
        NSLayoutConstraint.activate([
            chart.widthAnchor.constraint(equalToConstant: 300.0),
            chart.heightAnchor.constraint(equalToConstant: 300.0),
            chart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chart.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

