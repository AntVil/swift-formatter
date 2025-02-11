import ArgumentParser
import CodeFormatter

@main
struct Main: ParsableCommand {
    @Argument(help: "The file to format")
    var file: String

    mutating func run() throws {
        let sourceCode = try String(contentsOfFile: file)

        var iterator = SourceCodeIterator(sourceCode: sourceCode)

        while let token = iterator.nextToken() {
            print("\"\u{001B}[0;33m\(token)\u{001B}[0;0m\"")
        }
    }
}
