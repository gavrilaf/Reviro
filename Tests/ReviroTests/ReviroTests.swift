import XCTest
@testable import Reviro

class ReviroTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Reviro().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
