//
//  LoginViewModel.swift
//  TestTask
//
//  Created by Карим Садыков on 20.03.2023.
//

import Foundation

protocol LogInViewModelProtocol {
    func pushMainView()
}

class LogInViewModel: LogInViewModelProtocol {
    var coordinator: LogInCoordinator?
    
    func pushMainView(){
        coordinator?.didFinishLogIn()
    }
}
