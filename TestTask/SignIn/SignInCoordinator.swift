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
        let detailViewController = SignInViewController()
//        let detailViewModel = DetailsViewModel()
//        detailViewModel.coordinator = self
//        detailViewController.viewModel = detailViewModel
        navigationController.pushViewController(detailViewController, animated: true)
        navigationController.isNavigationBarHidden = false
    }
    
    func startDetailScene() {
        let detailCoordinator = LogInCoordinator(navigationController: navigationController)
        detailCoordinator.parentCoordinator = self
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
    
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func didFinishDetailScene() {
        navigationController.popViewController(animated: true)
    }
}
