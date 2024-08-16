//
//  ViewController.swift
//  LoginControllerApp
//
//  Created by dmitriy.dovgan on 16.08.2024.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {
	@IBOutlet weak var loginTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var signUpBtn: UIButton!
	
	let viewModel = SignUpViewModel()
	let bag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		loginTextField.rx.text.orEmpty
			.bind(to: viewModel.email)
			.disposed(by: bag)
		
		passwordTextField.rx.text.orEmpty
			.bind(to: viewModel.password)
			.disposed(by: bag)
		
		viewModel.isSignUpEnabled
			.bind(to: signUpBtn.rx.isEnabled)
			.disposed(by: bag)
		
	}
}

