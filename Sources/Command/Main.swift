import ArgumentParser
import CodeParser

@main
struct Main: ParsableCommand {
    @Argument(help: "The file to parse")
    var file: String

    mutating func run() throws {
        let sourceCode = try String(contentsOfFile: file)

        var iterator = SourceCodeIterator(sourceCode: sourceCode)

        while let token = iterator.nextToken() {
            print("\"\u{001B}[0;33m\(token)\u{001B}[0;0m\"")
        }
    }
}
