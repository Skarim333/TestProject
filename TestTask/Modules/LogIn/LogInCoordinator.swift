//
//  LogInCoordinator.swift
//  TestTask
//
//  Created by Карим Садыков on 11.03.2023.
//

import UIKit

final class LogInCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: SignInCoordinator?
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let logInViewController = LogInViewController()
        let logInViewModel = LogInViewModel()
        logInViewModel.coordinator = self
        logInViewController.viewModel = logInViewModel
        navigationController.pushViewController(logInViewController, animated: true)
        navigationController.isNavigationBarHidden = false
    }
 
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func didFinishLogInScene() {
        navigationController.popViewController(animated: true)
    }
 
    func didFinishLogIn() {
        if let sigInCoordinator = parentCoordinator {
            if let appCoordinator = sigInCoordinator.parentCoordinator {
                appCoordinator.childCoordinators.removeAll()
                appCoordinator.start()
            } else {
                parentCoordinator?.childDidFinish(self)
            }
        }
    }
}

