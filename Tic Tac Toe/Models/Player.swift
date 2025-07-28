//
//  Player.swift
//  Tic Tac Toe
//
//  Created by Karl Cridland on 28/07/2025.
//

import Foundation

protocol PlayerProtocol: Identifiable {
    var id: String { get }
    var name: String { get }
    var value: PlayerValue { get set }
}

struct Player: PlayerProtocol {
    let id: String
    let name: String
    var value: PlayerValue
    
    init(id: String = UUID().uuidString, name: String, value: PlayerValue = .nought) {
        self.id = id
        self.name = name
        self.value = value
    }
    
    static func ==(lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
    
    static func !=(lhs: Player, rhs: Player) -> Bool {
        !(lhs == rhs)
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
