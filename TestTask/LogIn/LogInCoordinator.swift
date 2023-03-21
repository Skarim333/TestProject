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
    
    func didFinishDetailScene() {
        navigationController.popViewController(animated: true)
    }
 
    func didFinishLoggingIn() {
        parentCoordinator?.childDidFinish(self)
        navigationController.setNavigationBarHidden(true, animated: true)
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        parentCoordinator?.childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.start()
    }
}

