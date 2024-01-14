//
//  SudokuTests.swift
//  SudokuSolverTests
//
//  Created by Jair Goh on 12/1/24.
//  Copyright © 2024 H. All rights reserved.
//

import XCTest
@testable import SudokuSolver

final class SudokuTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSolve_WithLastEmptySquareBoard_LoadSuccess() throws {
        var sudokuSolver = try SudokuSolver(sudokuString: """
        2564891733746159829817234565932748617128.\
        6549468591327635147298127958634849362715
        """)
        sudokuSolver.solve()
        XCTAssertEqual(
            sudokuSolver.getBoard(),
            "256489173374615982981723456593274861712836549468591327635147298127958634849362715"
        )
    }

    func testSolve_WithNakedSinglesBoard_LoadSuccess() throws {
        var sudokuSolver = try SudokuSolver(sudokuString: """
        3.542.81.4879.15.6.29.5637485.793.416132.\
        8957.74.6528.2413.9.655.867.192.965124.8
        """)
        sudokuSolver.solve()
        XCTAssertEqual(
            sudokuSolver.getBoard(),
            "365427819487931526129856374852793641613248957974165283241389765538674192796512438"
        )
    }

    func testSolve_WithHiddenSinglesBoard_LoadSuccess() throws {
        var sudokuSolver = try SudokuSolver(sudokuString: """
        67243.1..54.1.83..83..295..3.8.51..4.17.43\
        85..5.86.93..9..8..2.48.5.2.1.725..64.9
        """)
        sudokuSolver.solve()
        print(sudokuSolver.getBoard())
        XCTAssertEqual(
            sudokuSolver.getBoard(),
            "672435198549178362831629547368951274917243856254867931193784625486592713725316489"
        )
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
