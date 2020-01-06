//
//  UserViewModel.swift
//  SwiftUILogin
//
//  Created by Derek Yang on 2020-01-06.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import Foundation

class RegisterViewModel: ObservableObject {
	@Published var username: String = ""
	@Published var passcode: String = ""
	@Published var repeatPasscode: String = ""
	
	var isUsernameValid: Bool {
		username.count > 0
	}
	
	var isPasscodeValid: Bool {
		passcode.count == 6
	}
	
	var isRepeatPasscodeValid: Bool {
		isPasscodeValid && repeatPasscode == passcode
	}
	
	var allValid: Bool {
		isUsernameValid && isPasscodeValid && isRepeatPasscodeValid
	}
}

class UsernameLoginViewModel: RegisterViewModel {
	override var allValid: Bool {
		isUsernameValid && isPasscodeValid
	}
}
