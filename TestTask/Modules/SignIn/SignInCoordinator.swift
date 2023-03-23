//
//  SignInCoordinator.swift
//  TestTask
//
//  Created by Карим Садыков on 11.03.2023.
//

import UIKit

final class SignInCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: AppCoordinator?
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let signInViewController = SignInViewController()
        let signInViewModel = SignInViewModel()
        signInViewModel.coordinator = self
        signInViewController.viewModel = signInViewModel
        navigationController.pushViewController(signInViewController, animated: true)
        navigationController.isNavigationBarHidden = false
    }
    
    func startLogInScene() {
        let logInCoordinator = LogInCoordinator(navigationController: navigationController)
        logInCoordinator.parentCoordinator = self
        childCoordinators.append(logInCoordinator)
        logInCoordinator.start()
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func didFinishSignInScene() {
        navigationController.popViewController(animated: true)
    }
    
    func didFinishSignIn() {
        if let appCoordinator = parentCoordinator {
            appCoordinator.childCoordinators.removeAll()
            appCoordinator.start()
        } else {
            parentCoordinator?.childDidFinish(self)
        }
        
    }
}
