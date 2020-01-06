//
//  LoginView.swift
//  SwiftUILogin
//
//  Created by Derek Yang on 2020-01-05.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import SwiftUI

struct LoginView: View {
	@ObservedObject var loginViewModel: LoginViewModel
		
	private var rightToLeft: AnyTransition {
		.asymmetric(insertion: AnyTransition.move(edge: .trailing),
					removal: AnyTransition.move(edge: .trailing))
	}
	
	private var leftToRight: AnyTransition {
		.asymmetric(insertion: AnyTransition.move(edge: .leading),
					removal: AnyTransition.move(edge: .leading))
	}
	
	var body: some View {
		VStack {
			Text("Login")
				.font(.largeTitle)
				.padding(20)
			
			Spacer()
			
			// SwiftUI doesn't seem to have a good complex conditional support??? (e.g. switch)
			if loginViewModel.currentViewMode == .showLoginSelection {
				LoginSelectionView(currentViewMode: $loginViewModel.currentViewMode)
					.transition(leftToRight)
			}
			if loginViewModel.currentViewMode == .showLoginWithUsername {
				UsernameLoginView(currentViewMode: $loginViewModel.currentViewMode, userViewModel: UsernameLoginViewModel())
					.transition(rightToLeft)
			}
			if loginViewModel.currentViewMode == .showLoginWithLoginApp {
				LoginAppLoginView(currentViewMode: $loginViewModel.currentViewMode)
					.transition(rightToLeft)
			}
		
			Spacer()
			

			ScrollView(.horizontal) {
				HStack {
					TabView(action: {},
							imageName: "join_us",
							text: "Join us")
					
					TabView(action: {},
							imageName: "support",
							text: "Support")
					
					TabView(action: {},
							imageName: "about_us",
							text: "About us")
				}
			}
			.padding (.bottom, 20)
		}
	}
}

struct LoginSelectionView: View {
	@Binding var currentViewMode: LoginViewMode
	
	var body: some View {
		VStack {
			Button(action: {
				withAnimation { self.currentViewMode = .showLoginWithUsername }
			}) {
				Text("Login with username")
			}.padding()

			Button(action: {
				withAnimation { self.currentViewMode = .showLoginWithLoginApp }
			}) {
				Text("Login with Login App")
			}.padding()
		}
	}
}

struct UsernameLoginView: View {
	@Binding var currentViewMode: LoginViewMode
	@ObservedObject var userViewModel: UsernameLoginViewModel
	
	var body: some View {
		VStack {
			Text("Username")
			TextField("", text: $userViewModel.username)
				.padding()
				.textFieldStyle(RoundedBorderTextFieldStyle())
			
			Text("Passcode")
			TextField("", text: $userViewModel.passcode)
				.keyboardType(.numberPad)
				.textFieldStyle(RoundedBorderTextFieldStyle())
				.padding()
			Button(action: {}) {
				Text("Log in")
			}
				.enabled(userViewModel.allValid)
				.padding()
			
			BackButton(currentViewMode: $currentViewMode)
		}
		.frame(width: 300)
	}
}

struct LoginAppLoginView: View {
	@Binding var currentViewMode: LoginViewMode
	@State private var socialSecurityNumber: String = ""
	
	var body: some View {
		VStack {
			Text("Social security number")
			TextField("", text: $socialSecurityNumber)
				.textFieldStyle(RoundedBorderTextFieldStyle())
				.padding()
			
			BackButton(currentViewMode: $currentViewMode)
		}
		.frame(width: 300)
	}
}

struct BackButton: View {
	@Binding var currentViewMode: LoginViewMode
	
	var body: some View {
		Button(action: {
			withAnimation { self.currentViewMode = .showLoginSelection }
			
		}) {
			Image(systemName: "gobackward")
		}
	}
}

struct TabView: View {
	var action: () -> Void
	var imageName: String
	var text: String
	
	var body: some View {
		ZStack(alignment: .bottomTrailing) {
			Button(action: action) {
				Image(imageName)
					.renderingMode(.original)
				
			}
			.frame(width: 225, height: 150)
			
			Text(text)
			.padding(4)
				.foregroundColor(Color(UIColor.lightGray))
				.background(Color.black)
			.padding(4)
		}
		.padding(2)
	}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
		LoginView(loginViewModel: LoginViewModel())
    }
}

extension View {
	func enabled(_ enabled: Bool) -> some View {
		disabled(!enabled)
	}
}
