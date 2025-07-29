//
//  Tile.swift
//  Tic Tac Toe
//
//  Created by Karl Cridland on 28/07/2025.
//

class Tile: CustomStringConvertible {
    
    var value: PlayerValue?
    
    var isEmpty: Bool {
        value == nil
    }
    
    var description: String {
        switch value {
        case .cross:
            return "❌"
        case .nought:
            return "⭕️"
        default:
            return "⬛️"
        }
    }
    
}
