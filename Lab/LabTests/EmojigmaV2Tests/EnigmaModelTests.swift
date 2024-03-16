//
//  EnigmaModelTests.swift
//  LabTests
//
//  Created by Sam Franusic on 2/19/24.
//

@testable import Lab
import XCTest

final class EnigmaModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReflector() throws {
        let emojiSet = Lab.emojiSet
        guard
            let reflector = EnigmaModel(emojiSet: emojiSet)?.reflector,
            let testCase = emojiSet.first,
            let reflectedCase = reflector[testCase]
        else {
            XCTFail("Test setup failed")
            return
        }

        XCTAssertEqual(testCase, reflector[reflectedCase], "Test case should reflect back to its initial value")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. 
        // Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
