//
//  LoginViewModel.swift
//  SwiftUILogin
//
//  Created by Derek Yang on 2020-01-06.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import Foundation

enum LoginViewMode {
	case showLoginSelection
	case showLoginWithUsername
	case showLoginWithLoginApp
}

class LoginViewModel: ObservableObject {
	@Published var currentViewMode: LoginViewMode = .showLoginSelection
}
