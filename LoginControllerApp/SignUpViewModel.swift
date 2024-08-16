//
//  LoginViewModel.swift
//  LoginControllerApp
//
//  Created by dmitriy.dovgan on 16.08.2024.
//

import Foundation
import RxSwift
import RxRelay

struct SignUpViewModel {
	
	let email = BehaviorRelay<String>(value: "")
	let password = BehaviorRelay<String>(value: "")
	
	
	var isSignUpEnabled: Observable<Bool> {
			return Observable
			.combineLatest(_isEmailValid, _isPasswordValid) { $0 && $1 }
	}
	
	private var _isEmailValid: Observable<Bool> {
			return email.asObservable().map(_verifyEmail)
	}
	
	private var _isPasswordValid: Observable<Bool> {
			return password.asObservable().map { $0.count > 8 }
	}
	
	private func _verifyEmail(_ email: String) -> Bool {
			let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
			let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
			return emailPred.evaluate(with: email)
	}
}


