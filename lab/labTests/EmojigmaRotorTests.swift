//
//  EmojigmaRotorTests.swift
//  labTests
//
//  Created by Sam Franusic on 6/21/24.
//

@testable import lab
import XCTest

final class EmojigmaRotorTests: XCTestCase {

    func testRotorDoubleStep() {
        let emoji = EmojigmaPickerModel.emojiSet[1]
        let lastIndex = EmojigmaPickerModel.emojiSet.endIndex - 1
        let rotor = Rotor(notch: 0, notch2: lastIndex)

        // Assert on initial state.
        XCTAssertTrue(rotor.notch == 0, "Notch should be 0, but was: \(rotor.notch)")
        XCTAssertTrue(rotor.notch2 == lastIndex, "Notch2 should be 27, but was: \(rotor.notch2)")

        let result = rotor.connectionForward(emoji)

        // Assert on state after rotor is accessed.
        XCTAssertTrue(rotor.notch == 2, "Notch should be 2 after double step, but was: \(rotor.notch)")
        XCTAssertTrue(rotor.notch2 == 0, "Notch2 should be 0, but was: \(rotor.notch2)")
        XCTAssertNotEqual(emoji, result, "Initial emoji should be different than result")
    }

}
