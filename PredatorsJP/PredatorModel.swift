//
//  PredatorModel.swift
//  PredatorsJP
//
//  Created by André Filipe Fonsêca Borba on 29/10/23.
//

import Foundation
import SwiftUI

struct PredatorModel: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    func typeOverlay() -> Color {
        switch type {
        case "land": return .brown
        case "air": return .teal
        case "sea": return .blue
        default: return .brown
        }
    }
}

struct MovieScene: Codable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
