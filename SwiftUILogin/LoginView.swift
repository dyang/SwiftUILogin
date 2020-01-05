//
//  LoginView.swift
//  SwiftUILogin
//
//  Created by Derek Yang on 2020-01-05.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import SwiftUI

struct LoginView: View {
	var body: some View {
		VStack {
			Text("Login")
				.font(.largeTitle)
				.padding(20)
			
			Spacer()
			
			Button(action: {
				
			}) {
				Text("Login with username")
			}.padding()
			
			Button(action: {}) {
				Text("Login with Login App")
			}.padding()
		
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
		LoginView()
    }
}
