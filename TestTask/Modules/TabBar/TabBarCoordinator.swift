//
//  TabBarController.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: AppCoordinator!
    
    private let navigationController: UINavigationController
    var tabBarController: CustomTabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    func start() {
        let pages: [TabBarPages] = [.main, .favorite, .cart, .chat, .profile]
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        prepareTabBarController(withTabControllers: controllers)
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPages.main.pageOrderNumber()
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    private func getTabController(_ page: TabBarPages) -> UINavigationController {
        let navigationController = UINavigationController()
        
        let tabBarItem = tabBarController.createTabBarItem(withImage: page.pageImageValue(), tag: page.pageOrderNumber(), selectedImage: page.pageSelectImageValue())
        navigationController.tabBarItem = tabBarItem
        
        switch page {
        case .main:
            let mainCoordinator = MainCoordinator(navigationController: navigationController)
            mainCoordinator.parentCoordinator = self
            childCoordinators.append(mainCoordinator)
            mainCoordinator.start()
        case .favorite:
            let viewController = UIViewController()
            navigationController.pushViewController(viewController, animated: true)
            navigationController.isNavigationBarHidden = false
        case .cart:
            let viewController = UIViewController()
            navigationController.pushViewController(viewController, animated: true)
            navigationController.isNavigationBarHidden = false
        case .chat:
            let viewController = UIViewController()
            navigationController.pushViewController(viewController, animated: true)
            navigationController.isNavigationBarHidden = false
        case .profile:
            let profileCoordinator = ProfileCoordinator(navigationController: navigationController)
            profileCoordinator.parentCoordinator = self
            childCoordinators.append(profileCoordinator)
            profileCoordinator.start()
        }
        
        return navigationController
    }
    
    func didFinishImageryTabBar() {
        print(childCoordinators)
        childCoordinators = []
        parentCoordinator?.childDidFinish(self)
        parentCoordinator?.didFinishAllMainScreens()
        navigationController.dismiss(animated: true, completion: nil)
    }
}
