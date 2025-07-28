//
//  Player.swift
//  Tic Tac Toe
//
//  Created by Karl Cridland on 28/07/2025.
//

protocol PlayerProtocol {
    var id: String { get }
    var name: String { get }
    var value: PlayerValue { get set }
}

struct Player: PlayerProtocol {
    let id: String
    let name: String
    var value: PlayerValue
}

enum PlayerValue {
    case cross
    case nought
}
