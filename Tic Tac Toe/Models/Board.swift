//
//  Board.swift
//  Tic Tac Toe
//
//  Created by Karl Cridland on 28/07/2025.
//

protocol BoardProtocol {
    var winner: Player? { get }
    var opponent: Player? { get set }
    
    var tiles: [Tile] { get }
    
    func reset()
}

class Board: BoardProtocol {
    var winner: Player?
    var opponent: Player?
    var tiles: [Tile] = []
    
    func reset() {
        self.tiles.removeAll()
        for _ in 0..<9 {
            tiles.append(Tile())
        }
    }
    
}
