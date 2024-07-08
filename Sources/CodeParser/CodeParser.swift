public struct SourceCodeIterator {
    let sourceCode: String
    var index: String.Index

    public init(sourceCode: String) {
        self.sourceCode = sourceCode
        self.index = sourceCode.startIndex
    }

    public mutating func nextToken() -> Substring? {
        guard self.index < self.sourceCode.endIndex else {
            return nil
        }

        let startIndex = self.index
        var tokenType = CharacterTokenType(char: self.sourceCode[startIndex])

        while self.index < self.sourceCode.endIndex {
            let char = self.sourceCode[self.index]

            guard tokenType.compatibleWith(char: char) else {
                break
            }
            self.index = self.sourceCode.index(after: self.index)
        }

        return self.sourceCode[startIndex..<self.index]
    }
}

public enum CharacterTokenType {
    case empty
    case word
    case symbol

    init(char: Character) {
        switch char {
        case "\r", "\n", "\t", " ":
            self = .empty
        case "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            self = .word
        case ":", "=", ">", "<", "+", "-", "*", "/", "#", "\"", "{", "}", "[", "]", "(", ")", ",", ".", "@", "?", "!", ";":
            self = .symbol
        default:
            self = .empty
        }
    }

    mutating func compatibleWith(char: Character) -> Bool {
        return self == Self(char: char)
    }
}
