//
//  BoardModelView.swift
//  Tic Tac Toe
//
//  Created by Karl Cridland on 28/07/2025.
//

import Foundation

class BoardModelView: ObservableObject {
    
    @Published var board: Board
    
    init(_ player: Player) {
        self.board = Board(player: player)
    }
    
}
