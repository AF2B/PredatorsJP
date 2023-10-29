//
//  PredatorController.swift
//  PredatorsJP
//
//  Created by André Filipe Fonsêca Borba on 29/10/23.
//

import Foundation

class PredatorController {
    var predatorsData: [PredatorModel] = []
    
    init() {
        decodePredatorData()
    }
    
    func decodePredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                predatorsData = try decoder.decode([PredatorModel].self, from: data)
            } catch {
                print("Error: An issue decoding json data: \(error)")
            }
        }
    }
}
