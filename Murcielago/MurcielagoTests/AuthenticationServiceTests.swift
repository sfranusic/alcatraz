//
//  AuthenticationServiceTests.swift
//  MurcielagoTests
//
//  Created by Sam Franusic on 12/21/24.
//

import XCTest

final class AuthenticationServiceTests: XCTestCase {
    private var authService: MockAuthenticationService!

    override func setUp() {
        super.setUp()
        authService = MockAuthenticationService()
    }

    override func tearDown() {
        authService = nil
        super.tearDown()
    }

    func testInitialState() async {
        let isUnauthenticated = await authService.unauthenticated
        let isAuthenticated = await authService.authenticated

        XCTAssertTrue(isUnauthenticated, "Service should initially be unauthenticated.")
        XCTAssertFalse(isAuthenticated, "Service should not be authenticated initially.")
    }

    func testSignInSuccess() async {
        let result = await authService.signIn(username: "testuser", password: "password124")

        XCTAssertTrue(result, "Sign in method should succeed with valid credentials.")
        let isAuthenticated = await authService.authenticated
        let isUnauthenticated = await authService.unauthenticated
        XCTAssertTrue(isAuthenticated, "Service should be authenticated after successful sign in call.")
        XCTAssertFalse(isUnauthenticated)
    }

    func testSignInFailure() async {
        let result = await authService.signIn(username: "invaliduser", password: "wrongpassword")

        XCTAssertFalse(result, "Sign in method should fail with invalid credentials.")
        let isUnauthenticated = await authService.unauthenticated
        XCTAssertTrue(isUnauthenticated, "Service should remain unauthenticated after failed sign in call.")
    }

    func testSignOutSuccess() async {
        // Set up auth service to be signed in
        _ = await authService.signIn(username: "testuser", password: "password124")

        // Sign out
        let result = await authService.signOut()

        XCTAssertTrue(result, "Sign out method should succeed if signed in.")
        let isUnauthenticated = await authService.unauthenticated
        XCTAssertTrue(isUnauthenticated, "Service should be unauthenticated after successful sign out call.")
    }

    func testSignOutFailure() async {
        // Attempt to sign out without signing in
        let result = await authService.signOut()

        XCTAssertFalse(result, "Sign out method should fail if not signed in.")
        let isUnauthenticated = await authService.unauthenticated
        XCTAssertTrue(isUnauthenticated, "Service should remain unauthenticated after failed sign out call.")
    }
}
