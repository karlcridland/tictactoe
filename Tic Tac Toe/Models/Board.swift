//
//  Board.swift
//  Tic Tac Toe
//
//  Created by Karl Cridland on 28/07/2025.
//

class Board: BoardProtocol, CustomStringConvertible {
    
    let player: Player
    var opponent: Player?
    var currentPlayer: Player?
    var playingAsCrosses: Bool = false
    
    var winner: Player?
    var gameOver: Bool = false
    
    var tiles: [Tile] = []
    
    init(player: Player, opponent: Player? = nil) {
        self.player = player
        self.opponent = opponent
        self.chooseInitialPlayer()
        self.reset()
    }
    
    func chooseInitialPlayer(_ player: Player? = nil) {
        if let player = player {
            self.currentPlayer = player
        }
        else if let allPlayers = self.allPlayers {
            self.currentPlayer = allPlayers.randomElement()
        }
        self.playingAsCrosses = self.currentPlayer != self.player
    }
    
    var allPlayers: [Player]? {
        if let opponent = self.opponent {
            return [opponent, self.player]
        }
        return nil
    }
    
    func setValue(of position: Int) throws {
        if (gameOver) {
            return
        }
        guard tiles.indices.contains(position) else {
            throw BoardError.invalidTiles
        }
        let value = self.getCurrentPlayerValue()
        let tile = tiles[position]
        if (!tile.isEmpty) {
            throw BoardError.alreadyFilled
        }
        tile.value = value
        do {
            if try tiles.hasWinner() {
                self.winner = currentPlayer
                self.gameOver = true
            }
            else if try tiles.isADraw() {
                self.gameOver = true
            }
            else {
                try self.alternatePlayer()
            }
        }
        catch {
            print("Error: \(error)")
        }
    }
    
    func getCurrentPlayerValue() -> PlayerValue {
        if (self.currentPlayer == self.player) {
            return self.playingAsCrosses ? .cross : .nought
        }
        return !self.playingAsCrosses ? .cross : .nought
    }
    
    func getPlayer(_ value: PlayerValue) throws -> Player {
        if value == .cross && self.playingAsCrosses {
            return self.player
        }
        guard let opponent = self.opponent else {
            throw BoardError.noOpponent
        }
        return opponent
    }
    
    func alternatePlayer() throws {
        guard let oppenent = self.opponent else {
            throw BoardError.noOpponent
        }
        if let currentPlayer = self.currentPlayer {
            if oppenent == currentPlayer {
                self.currentPlayer = self.player
            }
            else {
                self.currentPlayer = oppenent
            }
        }
    }
    
    func reset() {
        self.gameOver = false
        self.winner = nil
        self.tiles.removeAll()
        for _ in 0..<9 {
            self.tiles.append(Tile())
        }
    }
    
    var description: String {
        ["\n", self.tiles.toString, "\n"].joined()
    }
    
}
