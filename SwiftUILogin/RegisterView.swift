//
//  RegisterView.swift
//  SwiftUILogin
//
//  Created by Derek Yang on 2019-12-26.
//  Copyright © 2019 Derek Yang. All rights reserved.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
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

struct RegisterView: View {
	@ObservedObject var state: AppState
	
	var body: some View {
		VStack {
			Text("Register new user")
				.font(.largeTitle)
				.padding()
			
			HStack {
				TextField("Username", text: $state.username)
					.textFieldStyle(RoundedBorderTextFieldStyle())
				if state.isUsernameValid {
					Image(systemName: "checkmark.circle.fill")
						.foregroundColor(.green)
				}
			}
			
			HStack {
				TextField("Passcode", text: $state.passcode)
					.keyboardType(.numberPad)
					.textFieldStyle(RoundedBorderTextFieldStyle())
				if state.isPasscodeValid {
					Image(systemName: "checkmark.circle.fill")
						.foregroundColor(.green)
				}
			}
			
			HStack {
				TextField("Repeat Passcode", text: $state.repeatPasscode)
					.keyboardType(.numberPad)
					.textFieldStyle(RoundedBorderTextFieldStyle())
				if state.isRepeatPasscodeValid {
					Image(systemName: "checkmark.circle.fill")
						.foregroundColor(.green)
				}
			}
			
			Button(action: {}) {
				Text("Register")
			}
			.disabled(!state.allValid)
			
			Spacer()
		}
		.frame(minWidth: 200, maxWidth: 300)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
		RegisterView(state: AppState())
    }
}
