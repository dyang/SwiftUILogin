//
//  RegisterView.swift
//  SwiftUILogin
//
//  Created by Derek Yang on 2019-12-26.
//  Copyright © 2019 Derek Yang. All rights reserved.
//

import SwiftUI
import Combine

struct RegisterView: View {
	@ObservedObject var state: UserViewModel
	
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
		RegisterView(state: UserViewModel())
    }
}
