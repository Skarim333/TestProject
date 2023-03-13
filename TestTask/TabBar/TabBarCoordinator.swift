//
//  TabBarController.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: MainCoordinator?
    
    private let navigationController: UINavigationController
    var tabBarController: CustomTabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    func start() {
        let pages: [TabBarPages] = [.main, .favourite, .cart, TabBarPages .profile]
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
        
        let tabBarItem = tabBarController.createTabBarItem(withImage: page.pageImageValue(), tag: page.pageOrderNumber())
        navigationController.tabBarItem = tabBarItem
        
        switch page {
//        case .explorer:
//            let mainCoordinator = MainCoordinator(navigationController: navigationController)
//            mainCoordinator.parentCoordinator = self
//            childCoordinators.append(mainCoordinator)
//            mainCoordinator.start()
//        case .cart:
//            let cartCoordinator = CartCoordinator(navigationController: navigationController)
//            cartCoordinator.parentCoordinator = self
//            childCoordinators.append(cartCoordinator)
//            cartCoordinator.start()
        default:
            let mainCoordinator = MainCoordinator(navigationController: navigationController)
            mainCoordinator.parentCoordinator = self
            childCoordinators.append(mainCoordinator)
            mainCoordinator.start()
        }
        
        return navigationController
    }
    
    func didFinishImageryTabBar() {
        childCoordinators = []
        parentCoordinator?.childDidFinish(self)
        navigationController.dismiss(animated: true, completion: nil)
    }
}
