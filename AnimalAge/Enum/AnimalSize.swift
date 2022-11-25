//
//  AnimalSize.swift
//  AnimalAge
//
//  Created by Marcelo Simim Santos on 11/25/22.
//

import Foundation

enum AnimalSize {
    case little
    case medium
    case big

    var multiplier: Double {
        switch self {
            case .little:
                return 6.0
            case .medium:
                return 7.0
            case .big:
                return 7.5
        }
    }
    
    var title: String {
        switch self {
            case .little:
                return "Pequeno"
            case .medium:
                return "Médio"
            case .big:
                return "Grande"
        }
    }
}
