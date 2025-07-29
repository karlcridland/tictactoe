//
//  Tic_Tac_ToeTests.swift
//  Tic Tac ToeTests
//
//  Created by Karl Cridland on 28/07/2025.
//

import XCTest
@testable import Tic_Tac_Toe

final class Tic_Tac_ToeTests: XCTestCase {
    
    func testBoardIsEmpty() throws {
        let board = MockBoard()
        let tiles = board.tiles
        let tileValues = tiles.map({$0.isEmpty})
        XCTAssertTrue(tiles.count == 9 && !tileValues.contains(false))
    }
    
    func testMoveIsValid() throws {
        let board = MockBoard()
        try? board.setValue(of: 0)
        guard let first = board.tiles.first else {
            XCTFail("Board should have at least one tile")
            return
        }
        XCTAssertEqual(first.value, .nought)
    }
    
    func testCannotGoOverFilledTile() throws {
        let board = MockBoard()
        try board.setValue(of: 0)
        do {
            try board.setValue(of: 0)
            XCTFail("Expected to throw BoardError.alreadyFilled, but no error was thrown")
        } catch let error as BoardError {
            XCTAssertEqual(error, .alreadyFilled)
        } catch {
            XCTFail("Unexpected error type: \(error)")
        }
    }
    
    func testPlayerSwitches() throws {
        let board = MockBoard()
        let currentPlayer = board.currentPlayer
        if board.opponent == nil {
            XCTFail("Board should have an opponent")
            return
        }
        try board.setValue(of: 0)
        XCTAssertNotEqual(currentPlayer, board.currentPlayer)
    }
    
    func testPlayerDoesNotSwitchOnInvalidMove() throws {
        let board = MockBoard()
        try? board.setValue(of: 0)
        let playerAfterFirstMove = board.currentPlayer
        try? board.setValue(of: 0)
        XCTAssertEqual(playerAfterFirstMove, board.currentPlayer)
    }
    
    func testWinningStreakWorks() throws {
        let board = MockBoard()
        guard let firstMove = board.currentPlayer else {
            XCTFail("Board should have a current player")
            return
        }
        board.movesForWin()
        XCTAssertEqual(firstMove, board.winner)
    }
    
    func testFullBoardDraw() throws {
        let board = MockBoard()
        board.movesForDraw()
        XCTAssertTrue(board.gameOver && board.winner == nil)
    }
    
    func testBoardResetsAfterWin() throws {
        let board = MockBoard()
        board.movesForWin()
        board.reset()
        XCTAssertTrue(board.tiles.allSatisfy({$0.isEmpty}) && !board.gameOver)
    }
    
    func testBoardResetsAfterDraw() throws {
        let board = MockBoard()
        board.movesForDraw()
        board.reset()
        XCTAssertTrue(board.tiles.allSatisfy({$0.isEmpty}) && !board.gameOver)
    }

}

class MockBoard: Board {
    
    init(opponent: Player? = nil) {
        let opponent = Player(name: "Opponent")
        super.init(player: Player(name: "Test"), opponent: opponent)
    }
    
    func movesForWin() {
        try? self.setValue(of: 0)
        try? self.setValue(of: 2)
        try? self.setValue(of: 4)
        try? self.setValue(of: 5)
        try? self.setValue(of: 8)
    }
    
    func movesForDraw() {
        try? self.setValue(of: 1)
        try? self.setValue(of: 0)
        try? self.setValue(of: 2)
        try? self.setValue(of: 4)
        try? self.setValue(of: 3)
        try? self.setValue(of: 5)
        try? self.setValue(of: 6)
        try? self.setValue(of: 7)
        try? self.setValue(of: 8)
    }
    
}
