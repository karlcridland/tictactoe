//
//  TileArray.swift
//  Tic Tac Toe
//
//  Created by Karl Cridland on 29/07/2025.
//

extension [Tile] {
    
    var toString: String {
        if (self.count != 9) {
            return "Invalid board size"
        }
        let values: [String] = allRows.map({$0.map({$0.description}).joined(separator: "")})
        return values.joined(separator: "\n")
    }
    
    func hasWinner() throws -> Bool {
        if (self.count != 9) {
            throw BoardError.invalidTiles
        }
        if let _ = [winnerByRow(), winnerByColumn(), winnerByDiagonal()].compactMap({$0}).first {
            return true
        }
        return false
    }
    
    func isADraw() throws -> Bool {
        return try !self.contains(where: {$0.isEmpty}) && !hasWinner()
    }
    
    private func winnerByRow() -> PlayerValue? {
        winner(from: allRows)
    }
    
    private func winnerByColumn() -> PlayerValue? {
        winner(from: allColumns)
    }
    
    private func winnerByDiagonal() -> PlayerValue? {
        winner(from: allDiagonals)
    }
    
    private var allDiagonals: [[Tile]] {
        [[self[0], self[4], self[8]], [self[2], self[4], self[6]]]
    }
    
    private var allRows: [[Tile]] {
        [0, 1, 2].map { (index) -> [Tile] in
            return self.row(index)
        }
    }
    
    private var allColumns: [[Tile]] {
        [0, 1, 2].map { (index) -> [Tile] in
            return self.column(index)
        }
    }
    
    func winner(from tiles: [[Tile]]) -> PlayerValue? {
        var result: PlayerValue?
        tiles.forEach { subtiles in
            if let winner = subtiles.map({$0.value}).winner {
                result = winner
                return
            }
        }
        return result
    }
    
    private func row(_ position: Int) -> [Tile] {
        let start = position * 3
        let finish = start + 3
        return Array(self[start ..< finish])
    }
    
    private func column(_ position: Int) -> [Tile] {
        let values: [Int] = [0, 3, 6]
        return values.map { (index) -> Tile in
            return self[index + position]
        }
    }
    
}

extension [PlayerValue?] {
    
    var winner: PlayerValue? {
        guard self.count == 3 else { return nil }
        guard let first = self[0] else { return nil }
        for value in self {
            if value != first {
                return nil
            }
        }
        return first
    }
    
}
