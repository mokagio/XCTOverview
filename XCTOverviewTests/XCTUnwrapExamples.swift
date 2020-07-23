import XCTest

class XCTUnwrapExample: XCTestCase {

    func testXCTUnwrap() throws {
        // `getUser(id:)` might return `.none` if there is no user matching the given `id`.
        //
        // We can user `XCTUnwrap` to make sure we have a non-optional value before continuing with
        // the test and fail if we don't. This makes the failure clearer and tidier than if we
        // accessed the properties of `user` with `?`. In that case, we'd have multiple nil
        // failures.
        let user = try XCTUnwrap(getUser(id: 3000))

        XCTAssertEqual(user.firstName, "Tony")
        XCTAssertEqual(user.lastName, "Stark")
    }

    func testWithoutXCTUnwrap() throws {
        let user = getUser(id: 3000)

        XCTAssertEqual(user?.firstName, "Tony")
        XCTAssertEqual(user?.lastName, "Stark")
    }

    struct User {
        let firstName: String
        let lastName: String
    }

    func getUser(id: Int) -> User? {
        guard id == 3000 else { return .none }

        return User(firstName: "Tony", lastName: "Stark")
    }
}
