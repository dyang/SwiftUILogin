//
//  LoginView.swift
//  SwiftUILogin
//
//  Created by Derek Yang on 2020-01-05.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import SwiftUI

enum LoginViewMode {
	case showLoginSelection
	case showLoginWithUsername
	case showLoginWithLoginApp
}

class LoginViewState: ObservableObject {
	@Published var currentViewMode: LoginViewMode = .showLoginSelection
}

struct LoginView: View {
	@ObservedObject var loginViewState: LoginViewState
		
	var rightToLeft: AnyTransition {
		let insertion = AnyTransition.move(edge: .trailing)
		let removal = AnyTransition.move(edge: .trailing)
		return .asymmetric(insertion: insertion, removal: removal)
	}
	
	var leftToRight: AnyTransition {
		let insertion = AnyTransition.move(edge: .leading)
		let removal = AnyTransition.move(edge: .leading)
		return .asymmetric(insertion: insertion, removal: removal)
	}
	
	var body: some View {
		VStack {
			Text("Login")
				.font(.largeTitle)
				.padding(20)
			
			Spacer()
			
			// SwiftUI doesn't seem to have a good complex conditional support??? (e.g. switch)
			if loginViewState.currentViewMode == .showLoginSelection {
				LoginSelectionView(currentViewMode: $loginViewState.currentViewMode)
					.transition(leftToRight)
			}
			if loginViewState.currentViewMode == .showLoginWithUsername {
				UsernameLoginView(currentViewMode: $loginViewState.currentViewMode)
					.transition(rightToLeft)
			}
			if loginViewState.currentViewMode == .showLoginWithLoginApp {
				LoginAppLoginView(currentViewMode: $loginViewState.currentViewMode)
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
				withAnimation {
					self.currentViewMode = .showLoginWithUsername
				}
			}) {
				Text("Login with username")
			}.padding()

			Button(action: {
				withAnimation {
					self.currentViewMode = .showLoginWithLoginApp
				}
			}) {
				Text("Login with Login App")
			}.padding()
		}
	}
}

struct UsernameLoginView: View {
	@Binding var currentViewMode: LoginViewMode
	@State var username: String = ""
	@State var passcode: String = ""
	
	var body: some View {
		VStack {
			Text("Username")
			TextField("", text: $username)
				.padding()
				.textFieldStyle(RoundedBorderTextFieldStyle())
			
			Text("Passcode")
			TextField("", text: $passcode)
				.padding()
				.textFieldStyle(RoundedBorderTextFieldStyle())
			
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
			withAnimation {
				self.currentViewMode = .showLoginSelection
			}
			
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
		LoginView(loginViewState: LoginViewState())
    }
}
