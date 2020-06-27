import XCTest
@testable import XCTOverview

private var statefulValue: Int = 0

class SetUpTearDownExamples: XCTestCase {

    // There is no "with error" version of this, yet.
    override class func setUp() {
        print("This runs before all tests")
        statefulValue += 1
    }

    override func setUpWithError() throws {
        print("This runs before each test")
        statefulValue += 1
    }

    override func tearDownWithError() throws {
        print("This runs after each test")
    }

    // There is no "with error" version of this, yet.
    override class func tearDown() {
        print("This runs after each test")
    }

    // Using A and B so we can control in which order these tests run, because order matters here.
    //
    // Note that if we turn on the randomized test execution option in the scheme, these tests might
    // fail. This is a good example of why you shouldn't depend on global state and execution order
    // in your tests.
    //
    // TODO: Move this test in a dedicated target or scheme so that we can keep using it as an
    // example of the drawbacks of depending on state in the tests.
    func testA() throws {
        XCTAssertEqual(statefulValue, 2)
    }

    func testB() throws {
        XCTAssertEqual(statefulValue, 3)
    }
}
