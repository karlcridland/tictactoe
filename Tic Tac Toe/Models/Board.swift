//
//  Board.swift
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

class Board: BoardProtocol {
    let player: Player
    var winner: Player?
    var opponent: Player?
    var currentPlayer: Player?
    
    var tiles: [Tile] = []
    
    init(player: Player, opponent: Player? = nil) {
        self.player = player
        self.opponent = opponent
        self.reset()
    }
    
    func setValue(of tile: Tile, to value: PlayerValue) throws {
        if (!tile.isEmpty) {
            throw BoardError.alreadyFilled
        }
        tile.value = value
        try? self.alternatePlayer()
    }
    
    func alternatePlayer() throws {
        guard let oppenent = self.opponent else {
            throw BoardError.noOpponent
        }
        if let currentPlayer = self.currentPlayer {
            if oppenent == currentPlayer {
                self.currentPlayer = nil
            }
            else {
                self.currentPlayer = oppenent
            }
        }
    }
    
    func reset() {
        self.winner = nil
        self.tiles.removeAll()
        for _ in 0..<9 {
            self.tiles.append(Tile())
        }
    }
    
}

enum BoardError: Error {
    case alreadyFilled
    case noOpponent
}
