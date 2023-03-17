//
//  AppCoordinator.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let shared = AuthManager.shared
        navigationController.setNavigationBarHidden(true, animated: true)
//        if shared.isSignedIn {
//            let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
//            childCoordinators.append(tabBarCoordinator)
//            tabBarCoordinator.start()
//        } else {
            let signInCordinator = LogInCoordinator(navigationController: navigationController)
            childCoordinators.append(signInCordinator)
            signInCordinator.start()
//        }
        
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
