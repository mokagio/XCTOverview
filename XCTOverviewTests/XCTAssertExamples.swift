import XCTest

class XCTAssertExamples: XCTestCase {

    func testXCTAssert() {
        XCTAssert(true)
        XCTAssert(true, "A custom message")

        XCTAssertTrue(true)
        XCTAssertTrue(true, "A custom message")

        XCTAssertFalse(false)
        XCTAssertFalse(false, "A custom message")

        XCTAssertNil(.none)
        XCTAssertNil(.none, "A custom message")

        XCTAssertNotNil(.some(1))
        XCTAssertNotNil(.some(1), "A custom message")

        XCTAssertEqual(1, 1)
        XCTAssertEqual(1, 1, "A custom message")

        // TODO: XCTAssertEqual with custom Equatable type
        // TODO: XCTAssertEqual with accuracy for special numeric types

        XCTAssertNotEqual(1, 2)
        XCTAssertNotEqual(1, 2, "A custom message")

        XCTAssertLessThan(1, 2)
        XCTAssertLessThan(1, 2, "A custom message")

        XCTAssertLessThanOrEqual(1, 2)
        XCTAssertLessThanOrEqual(2, 2)
        XCTAssertLessThanOrEqual(1, 2, "A custom message")

        XCTAssertGreaterThan(2, 1)
        XCTAssertGreaterThan(2, 1, "A custom message")

        XCTAssertGreaterThanOrEqual(2, 1)
        XCTAssertGreaterThanOrEqual(2, 2)
        XCTAssertGreaterThanOrEqual(2, 1, "A custom message")

        // TODO: Example of these with custom Comparable type:
        // - XCTAssertLessThan
        // - XCTAssertLessThanOrEqual
        // - XCTAssertGreaterThan
        // - XCTAssertGreaterThanOrEqual

        XCTAssertThrowsError(try { throw TestError() }())
        XCTAssertThrowsError(try { throw TestError() }()) { error in
            XCTAssertTrue(error is TestError)
        }
        XCTAssertThrowsError(try { throw TestError() }(), "A custom message")

        XCTAssertNoThrow({ 1 }())
        XCTAssertNoThrow({ 1 }(), "A custom message")
    }
}

private struct TestError: Error { }
