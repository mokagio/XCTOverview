import XCTest

class AsyncExpectationExamples: XCTestCase {

    func testExampleOfAsyncTestFailure() throws {
        // Switch to false to see this test checking async code fail
        let shouldSkip = true
        try XCTSkipIf(shouldSkip, "Skipping example test failing to check async code.")

        var x = 0

        DispatchQueue.main.async {
            x = 1
        }

        // The problem with this test is that because the code that changes `t` from `0` to `1`
        // is dispatched asynchronously, the following `XCTAssertEqual` runs _before_ the code
        // changing `t`.
        XCTAssertEqual(x, 1)
    }

    func testWaitForSingleExpectation() {
        var x = 0

        let expectation = XCTestExpectation(description: "Change value of t.")

        DispatchQueue.main.async {
            x = 1
            expectation.fulfill()
        }

        // This code waits for the `expectation` to be fulfilled (i.e. for its `fulfill()` method
        // to have been called) for `timeout` seconds.
        wait(for: [expectation], timeout: 0.3)

        XCTAssertEqual(x, 1)
    }
}
