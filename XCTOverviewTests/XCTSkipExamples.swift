import XCTest

class XCTestSkipExamples: XCTestCase {

    func testSkip() throws {
        let condition = false
        guard condition else {
            throw XCTSkip("Guard condition failed.")
        }
    }

    func testSkipIf() throws {
        let condition = true
        try XCTSkipIf(condition)
    }

    func testSkipIfWithMessage() throws {
        let condition = true
        try XCTSkipIf(condition, "A custom skip message")
    }

    func testSkipUnless() throws {
        let condition = false
        try XCTSkipUnless(condition)
    }

    func testSkipUnlessWithMessage() throws {
        let condition = false
        try XCTSkipUnless(condition, "A custom skip message")
    }
}
