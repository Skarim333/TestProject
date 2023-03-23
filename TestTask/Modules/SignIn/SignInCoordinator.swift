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
    
    func startLognInScene() {
        let logInCoordinator = LogInCoordinator(navigationController: navigationController)
        logInCoordinator.parentCoordinator = self
        childCoordinators.append(logInCoordinator)
        logInCoordinator.start()
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
