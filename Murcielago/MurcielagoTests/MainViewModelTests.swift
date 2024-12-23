//
//  MainViewModelTests.swift
//  MurcielagoTests
//
//  Created by Sam Franusic on 12/21/24.
//

import Testing

struct MainViewModelTests {

    @Test func testInitialState() async throws {
        let testViewModel = await MainViewModel(authenticationService: .mock)
        #expect(await testViewModel.errorMessage == "")
    }

    @Test func testInitialTextFieldStates() async throws {
        let testViewModel = await MainViewModel(authenticationService: .mock)
        #expect(await testViewModel.passwordInput == "")
        #expect(await testViewModel.usernameInput == "")
    }

    @Test func testSignInErrorWithNoCredentials() async throws {
        let testViewModel = await MainViewModel(authenticationService: .mock)
        await _ = testViewModel.signIn()
        #expect(await testViewModel.errorMessage == SignInError.noCredentials.localizedDescription)
    }

    @Test func testSignInErrorWithBadCredentials() async throws {
        let testViewModel = await MainViewModel(authenticationService: .mock)
        await MainActor.run {
            testViewModel.usernameInput = "badUsername"
            testViewModel.passwordInput = "badPassword"
        }
        await _ = testViewModel.signIn()
        #expect(await testViewModel.errorMessage == SignInError.invalidCredentials.localizedDescription)
    }

    @Test func testSignInSuccess() async throws {
        let testViewModel = await MainViewModel(authenticationService: .mock)
        await MainActor.run {
            testViewModel.usernameInput = "username"
            testViewModel.passwordInput = "password124"
        }
        let result = await testViewModel.signIn()
        #expect(result)
        #expect(await testViewModel.unauthenticated == false)
    }

}
