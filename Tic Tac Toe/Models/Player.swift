//
//  Player.swift
//  Tic Tac Toe
//
//  Created by Karl Cridland on 28/07/2025.
//

import Foundation

protocol PlayerProtocol: Identifiable, Equatable {
    var id: String { get }
    var name: String { get }
}

struct Player: PlayerProtocol, CustomStringConvertible {
    let id: String
    let name: String
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
    
    static func ==(lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
    
    static func !=(lhs: Player, rhs: Player) -> Bool {
        !(lhs == rhs)
    }
    
    var description: String {
        name
    }
    
}

struct AIPlayer: PlayerProtocol {
    let id: String
    let name: String
    var value: PlayerValue
}

enum PlayerValue {
    case cross
    case nought
}
