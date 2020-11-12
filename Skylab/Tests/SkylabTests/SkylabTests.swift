import XCTest
@testable import Skylab

final class SkylabTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Skylab().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
