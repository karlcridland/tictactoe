//
//  BoardProtocol.swift
//  Tic Tac Toe
//
//  Created by Karl Cridland on 28/07/2025.
//

protocol BoardProtocol {
    var player: Player { get }
    var opponent: Player? { get set }
    var currentPlayer: Player? { get set }
    var winner: Player? { get }
    
    var tiles: [Tile] { get set }
}
