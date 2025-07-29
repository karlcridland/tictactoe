//
//  BoardError.swift
//  Tic Tac Toe
//
//  Created by Karl Cridland on 28/07/2025.
//

enum BoardError: Error {
    case alreadyFilled
    case noOpponent
    case noCurrentPlayer
    case invalidTiles
}
