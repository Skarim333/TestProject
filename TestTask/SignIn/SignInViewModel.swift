//
//  SignInViewModel.swift
//  TestTask
//
//  Created by Карим Садыков on 16.03.2023.
//

import Foundation

protocol SignInViewModelProtocol: AnyObject {
    func pushLoginView()
    func pushMainView()
    
}

class SignInViewModel: SignInViewModelProtocol {
    
    var coordinator: SignInCoordinator?
    
    func pushLoginView() {
        coordinator?.startLognInScene()
    }
    
    func  pushMainView() {
        coordinator?.didFinishLoggingIn()
    }
}
