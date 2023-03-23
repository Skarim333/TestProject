//
//  MainCoordinator.swift
//  TestTask
//
//  Created by Карим Садыков on 11.03.2023.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: TabBarCoordinator?
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController = MainViewController()
        let networkManager = NetworkManager()
        let mainViewModel = MainViewModel(networkManager: networkManager)
        mainViewModel.coordinator = self
        mainViewController.viewModel = mainViewModel
        navigationController.setViewControllers([mainViewController], animated: true)
    }
    
    func startDetailScene() {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
        detailCoordinator.parentCoordinator = self
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
}
