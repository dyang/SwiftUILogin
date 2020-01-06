//
//  SwiftUILoginTests.swift
//  SwiftUILoginTests
//
//  Created by Derek Yang on 2019-12-26.
//  Copyright © 2019 Derek Yang. All rights reserved.
//

import XCTest
@testable import SwiftUILogin

class RegistrationValidationTests: XCTestCase {
	let state = RegisterViewModel()
	
	func testAllEmpty() {
		XCTAssertFalse(state.allValid)
	}
	
	func testHappyPath() {
		state.username = "Derek"
		state.passcode = "112233"
		state.repeatPasscode = "112233"
		XCTAssertTrue(state.allValid)
	}
	
	func testUsername() {
		state.username = ""
		XCTAssertFalse(state.isUsernameValid)
		
		state.username = "Derek"
		XCTAssertTrue(state.isUsernameValid)
	}
	
	func testPasscode() {
		state.passcode = "11"
		XCTAssertFalse(state.isPasscodeValid)
		
		state.passcode = "112233"
		XCTAssertTrue(state.isPasscodeValid)
		
		state.passcode = "11223344"
		XCTAssertFalse(state.isPasscodeValid)
	}
	
	func testRepeatPasscode() {
		state.passcode = "112233"
		state.repeatPasscode = ""
		XCTAssertFalse(state.isRepeatPasscodeValid)
		
		state.repeatPasscode = "112233"
		XCTAssertTrue(state.isRepeatPasscodeValid)
	}
}
