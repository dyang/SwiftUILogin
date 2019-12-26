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
	@Published var password: String = ""
	@Published var repeatPassword: String = ""
}

struct RegisterView: View {
	@ObservedObject var state: AppState
	
    var body: some View {
		VStack {
			Text("Register new user")
				.font(.largeTitle)
				.padding()
			Text("Username")
			TextField("", text: $state.username)
				.textFieldStyle(RoundedBorderTextFieldStyle())
			Text("Password")
			TextField("", text: $state.password)
				.textFieldStyle(RoundedBorderTextFieldStyle())
			Text("Repeat password")
			TextField("", text: $state.repeatPassword)
				.textFieldStyle(RoundedBorderTextFieldStyle())
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
