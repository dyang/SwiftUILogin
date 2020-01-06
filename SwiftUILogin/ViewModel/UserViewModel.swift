//
//  UserViewModel.swift
//  SwiftUILogin
//
//  Created by Derek Yang on 2020-01-06.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import Foundation

class UserViewModel: ObservableObject {
	@Published var username: String = ""
	@Published var passcode: String = ""
	@Published var repeatPasscode: String = ""
	
	var isUsernameValid: Bool {
		return username.count > 0
	}
	
	var isPasscodeValid: Bool {
		return passcode.count == 6
	}
	
	var isRepeatPasscodeValid: Bool {
		return isPasscodeValid && repeatPasscode == passcode
	}
	
	var allValid: Bool {
		return isUsernameValid && isPasscodeValid && isRepeatPasscodeValid
	}
}
