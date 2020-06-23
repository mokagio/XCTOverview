import XCTest
@testable import XCTOverview

private var statefulValue: Int = 0

class XCTOverviewTests: XCTestCase {

    // There is no "with error" version of this, yet.
    override class func setUp() {
        print("This run before all tests")
        statefulValue += 1
    }

    override func setUpWithError() throws {
        print("This run before each test")
        statefulValue += 1
    }

    override func tearDownWithError() throws {
        print("This runs after each test")
    }

    // There is no "with error" version of this, yet.
    override class func tearDown() {
        print("This runs after each test")
    }

    func testA() throws {
        XCTAssertEqual(statefulValue, 2)
    }

    func testB() throws {
        XCTAssertEqual(statefulValue, 3)
    }
}
