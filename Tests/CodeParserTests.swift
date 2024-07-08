import XCTest

@testable import CodeParser

final class CodeParserTests: XCTestCase {
    func testTokenization() throws {
        XCTAssertEqual(
            SourceCodeIterator(sourceCode: "let x: Int = 10e3").allTokens,
            ["let", " ", "x", ":", " ", "Int", " ", "=", " ", "10e3"]
        )

        XCTAssertEqual(
            SourceCodeIterator(sourceCode: "let x=10e3").allTokens,
            ["let", " ", "x", "=", "10e3"]
        )

        XCTAssertEqual(
            SourceCodeIterator(sourceCode: "x += y").allTokens,
            ["x", " ", "+=", " ", "y"]
        )

        XCTAssertEqual(
            SourceCodeIterator(sourceCode: " /* */ /* */ ").allTokens,
            [" ", "/* */", " ", "/* */", " "]
        )

        XCTAssertEqual(
            SourceCodeIterator(sourceCode: " /* \n/* */\n */ ").allTokens,
            [" ", "/* \n/* */\n */", " "]
        )

        XCTAssertEqual(
            SourceCodeIterator(sourceCode: " #\" \\(abc) \"# ").allTokens,
            [" ", "#\" \\(abc) \"#", " "]
        )

        XCTAssertEqual(
            SourceCodeIterator(sourceCode: " #/ \\/ /# ").allTokens,
            [" ", "#/ \\/ /#", " "]
        )
    }
}

extension SourceCodeIterator {
    var allTokens: [Substring] {
        var copy = self
        var result = [Substring]()
        while let token = copy.nextToken() {
            result.append(token)
        }
        return result
    }
}
