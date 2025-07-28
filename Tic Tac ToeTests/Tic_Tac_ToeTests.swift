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
        guard let first = board.tiles.first else {
            XCTFail("Board should have at least one tile")
            return
        }
        try? board.setValue(of: first, to: .cross)
        XCTAssertEqual(first.value, .cross)
    }
    
    func testCannotGoOverFilledTile() throws {
        let board = MockBoard()
        guard let first = board.tiles.first else {
            XCTFail("Board should have at least one tile")
            return
        }
        try board.setValue(of: first, to: .cross)
        do {
            try board.setValue(of: first, to: .nought)
            XCTFail("Expected to throw BoardError.alreadyFilled, but no error was thrown")
        } catch let error as BoardError {
            XCTAssertEqual(error, .alreadyFilled)
        } catch {
            XCTFail("Unexpected error type: \(error)")
        }
    }
    
    func testPlayerSwitches() throws {
        
    }
    
    func testPlayerDoesNotSwitchOnInvalidMove() throws {
        
    }
    
    func testWinningStreakWorks() throws {
        
    }
    
    func testFullBoardDraw() throws {
        
    }
    
    func testBoardResetsAfterWin() throws {
        
    }
    
    func testBoardResetsAfterDraw() throws {
        
    }

}

class MockBoard: Board {
    
    init() {
        super.init(player: Player(name: "Test"))
    }
    
}
