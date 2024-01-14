struct NormalSudoku: Sudoku {
    init(sudokuString: String) {
        emptyCells = Set<Cell>()
        isSolved = false
        for (idx, value) in sudokuString.enumerated() {
            let row: Int = idx / boardRows
            let column: Int = idx % boardRows
            let newCell = Cell(row: row, col: column)
            if value == "." {
                emptyCells.insert(newCell)
            } else {
                valuesOfCells[newCell] = value.wholeNumberValue
            }
        }
    }

    mutating func set(cell: Cell, to value: Int?) {
        valuesOfCells[cell] = value

        if value != nil {
            emptyCells.remove(cell)
        } else {
            emptyCells.insert(cell)
        }

        if emptyCells.isEmpty {
            isSolved = true
        }
    }

    func getBoard() -> String {
        var s: String = ""
        for i in 0..<boardRows {
            for j in 0..<boardColumns {
                let val = valuesOfCells[Cell(row: i, col: j)]
                s += val == nil ? "." : String(val!)
            }
        }
        return s
    }

    func options(in cell: Cell) -> Set<Int> {
        var optionSet = Set<Int>()
        for option in 1...9 {

            if rowCheck(option: option, row: cell.row) {
                continue
            }
            if columnCheck(option: option, column: cell.col) {
                continue
            }
            if squareCheck(option: option, row: cell.row, column: cell.col) {
                continue
            }

            optionSet.insert(option)
        }

        return optionSet
    }

    private func rowCheck(option: Int, row: Int) -> Bool {
        for column in 0..<boardRows where valuesOfCells[Cell(row: row, col: column)] == option {
            return true
        }
        return false
    }

    private func columnCheck(option: Int, column: Int) -> Bool {
        for row in 0..<boardColumns where valuesOfCells[Cell(row: row, col: column)] == option {
            return true
        }
        return false
    }

    private func squareCheck(option: Int, row: Int, column: Int) -> Bool {
        let r = (row / 3) * 3 + 1
        let c = (column / 3) * 3 + 1
        for i in [-1, 0, 1] {
            for j in [-1, 0, 1] where valuesOfCells[Cell(row: r + i, col: c + j)] == option {
                return true
            }
        }
        return false
    }

    private let boardRows = 9
    private let boardColumns = 9

    private var valuesOfCells: [Cell: Int] = [:]

    var emptyCells: Set<Cell>

    var isSolved: Bool
}
