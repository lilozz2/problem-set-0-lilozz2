struct SudokuSolver {
    var sudoku: NormalSudoku
    var emptyCells: [Cell]

    init(sudokuString: String) throws {
        sudoku = NormalSudoku(sudokuString: sudokuString)
        emptyCells = Array(sudoku.emptyCells)
    }

    mutating func solve() {
        solveNext(index: 0)
    }

    func getBoard() -> String {
        sudoku.getBoard()
    }

    mutating func solveNext(index: Int) {
        let cell: Cell = emptyCells[index]
        let options = sudoku.options(in: cell)
        for option in options {
            sudoku.set(cell: cell, to: option)
            if sudoku.isSolved {
                return
            }
            solveNext(index: index + 1)
            if sudoku.isSolved {
                return
            }
            sudoku.set(cell: cell, to: nil)
        }
    }
}
