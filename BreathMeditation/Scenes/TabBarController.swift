//
//  TabBarController.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/7/22.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.backgroundColor = .primaryWhite
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        additionalSafeAreaInsets.bottom = 6
        tabBar.addCornerRadius(6, [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        tabBar.tintColor = .primaryIndigo
        tabBar.addDropShadow()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let homeTab = UINavigationController(rootViewController: HomeVC())
        let homeTabItem = UITabBarItem(title: "Home",
                                       image: UIImage(systemName: "house"),
                                       selectedImage: UIImage(systemName: "house.fill"))
        homeTab.tabBarItem = homeTabItem
        
        let topicTab = ChooseTopicVC()
        let topicTabItem = UITabBarItem(title: "Topics",
                                       image: UIImage(systemName: "person"),
                                       selectedImage: UIImage(systemName: "person.fill"))
        topicTab.tabBarItem = topicTabItem
        
        let startedTab = GetStartedVC()
        let startedTabItem = UITabBarItem(title: "Started",
                                       image: UIImage(systemName: "crown"),
                                       selectedImage: UIImage(systemName: "crown.fill"))
        startedTab.tabBarItem = startedTabItem
        
        self.viewControllers = [homeTab, topicTab, startedTab]
    }
    
    
    
    
    
    
    
}
