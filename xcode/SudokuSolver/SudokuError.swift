enum SudokuError: Error {
    case invalidSudoku
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
