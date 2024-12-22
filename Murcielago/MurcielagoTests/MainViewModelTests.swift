//
//  MainViewModelTests.swift
//  MurcielagoTests
//
//  Created by Sam Franusic on 12/21/24.
//

import Testing

struct MainViewModelTests {

    @Test func testInitialState() async throws {
        let testViewModel = MainViewModel(authenticationService: .mock)
        #expect(testViewModel.errorMessage == "")
    }

}
