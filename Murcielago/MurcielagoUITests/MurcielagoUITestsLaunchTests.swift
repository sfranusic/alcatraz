//
//  MurcielagoUITestsLaunchTests.swift
//  MurcielagoUITests
//
//  Created by Sam Franusic on 11/11/24.
//

import XCTest

class MurcielagoUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() async throws {
        async let app = XCUIApplication()
        await app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = await XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
