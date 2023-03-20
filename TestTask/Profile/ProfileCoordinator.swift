//
//  ProfileCoordinator.swift
//  TestTask
//
//  Created by Карим Садыков on 17.03.2023.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: TabBarCoordinator?
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let profileViewController = ProfileViewController()
        let profileViewModel = ProfileViewModel()
        profileViewModel.coordinator = self
        profileViewController.viewModel = profileViewModel
        navigationController.pushViewController(profileViewController, animated: true)
        navigationController.isNavigationBarHidden = false
    }
    
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func didFinishDetailScene() {
        navigationController.popViewController(animated: true)
    }
}
