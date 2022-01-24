//
//  GraficasEntity.swift
//  newExamen
//
//  Created by A on 23/01/22.
//

import Foundation

// Models

struct QuestResult: Codable {
    let colors: [String]
    let questions: [question]
    enum CodingKeys: String, CodingKey {
        case colors
        case questions
        
    }
}

struct question: Codable {
    let total: Int
    let text: String
    let chartData: [ChartData]
}

struct ChartData: Codable {
    let text: String
    let percetnage: Int
}
