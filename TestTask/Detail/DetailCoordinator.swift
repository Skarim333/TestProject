//
//  DetailCoordinator.swift
//  TestTask
//
//  Created by Карим Садыков on 17.03.2023.
//

import UIKit

final class DetailCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: MainCoordinator?
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let detailViewController = DetailsViewController()
        let detailViewModel = DetailsViewModel()
        detailViewModel.coordinator = self
        detailViewController.viewModel = detailViewModel
        navigationController.pushViewController(detailViewController, animated: true)
        navigationController.isNavigationBarHidden = false
    }
    
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func didFinishDetailScene() {
        navigationController.popViewController(animated: true)
    }
}
