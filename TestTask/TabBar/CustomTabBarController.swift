//
//  CustomTabBarController.swift
//  TestTask
//
//  Created by Карим Садыков on 11.03.2023.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.clipsToBounds = true
        tabBar.itemWidth = 50
        tabBar.itemSpacing = 40
        tabBar.itemPositioning = .centered
        tabBar.tintColor = .red
        tabBar.backgroundColor = .black
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.layer.cornerRadius = 30
        let barAppearance = UITabBarAppearance()
        barAppearance.backgroundColor = .white
        tabBar.standardAppearance = barAppearance
        tabBar.scrollEdgeAppearance = barAppearance
        tabBar.frame = CGRect(x: 0, y: view.height - 102, width: view.width, height: 102)
    }

    private func annimationsWhenSelectedItem(_ item: UITabBarItem) {
//        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
//        
//        let timeInterval: TimeInterval = 0.2
//        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
//            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
//        }
//
//        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
//        propertyAnimator.startAnimation()
    }

    func createTabBarItem(withImage image: UIImage?, tag: Int) -> UITabBarItem {
        tabBarItem = UITabBarItem.init(title: "",
                                       image: image,
                                       tag: tag)
        
        tabBarItem.imageInsets = UIEdgeInsets.init(top: 20, left: 0, bottom: -20, right: 0)
        
        return tabBarItem
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.annimationsWhenSelectedItem(item)
    }
}

extension CustomTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Get the selected index
        let selectedIndex = tabBarController.selectedIndex
        
        // Set the background color and tint color based on the selected index
        switch selectedIndex {
        case 0:
            tabBarController.tabBar.backgroundColor = UIColor.red
            tabBarController.tabBar.tintColor = UIColor.red
        case 1:
            tabBarController.tabBar.backgroundColor = UIColor.blue
            tabBarController.tabBar.tintColor = UIColor.blue
        case 2:
            tabBarController.tabBar.backgroundColor = UIColor.green
            tabBarController.tabBar.tintColor = UIColor.green
        case 3:
            tabBarController.tabBar.backgroundColor = UIColor.yellow
            tabBarController.tabBar.tintColor = UIColor.yellow
        case 4:
            tabBarController.tabBar.backgroundColor = UIColor.purple
            tabBarController.tabBar.tintColor = UIColor.purple
        default:
            tabBarController.tabBar.backgroundColor = UIColor.yellow
            tabBarController.tabBar.tintColor = UIColor.black
        }
    }
}
