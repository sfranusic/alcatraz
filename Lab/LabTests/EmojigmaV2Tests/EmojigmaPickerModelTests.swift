//
//  EmojigmaPickerModelTests.swift
//  LabTests
//
//  Created by Sam Franusic on 2/17/24.
//

@testable import Lab
import SwiftUI
import XCTest

final class EmojigmaPickerModelTests: XCTestCase {
    @ObservedObject var pickerModel = EmojigmaPickerModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPickerUpdate() throws {
        let testValue = "*"
        XCTAssertNotEqual(testValue, pickerModel.rotor1)
        @State var testBinding = pickerModel.$rotor1
        testBinding.wrappedValue = testValue

        XCTAssertEqual(testValue, pickerModel.rotor1)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results 
        // with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
