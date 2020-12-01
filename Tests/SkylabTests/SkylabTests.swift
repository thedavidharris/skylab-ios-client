import XCTest
@testable import Skylab

final class SkylabTests: XCTestCase {
    func testInitialize() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let client:SkylabClientImpl = Skylab.initialize(apiKey: "apiKey", config: SkylabConfig(instanceName: "testInstance")) as! SkylabClientImpl
        XCTAssertEqual(client.apiKey, "apiKey")
        XCTAssertEqual(client.config.instanceName, "testInstance")
    }

    static var allTests = [
        ("testInitialize", testInitialize),
    ]
}
