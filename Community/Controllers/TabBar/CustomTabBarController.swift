//
//  CustomTabBarController.swift
//  Community
//
//  Created by Kevin Gu on 10/13/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class CustomedTabBarController: UITabBarController {
    override func viewDidLoad() {
        
        let communityViewController = CommunityViewController(collectionViewLayout: UICollectionViewFlowLayout())
        communityViewController.title = "Community"
        let communityNavigationController = UINavigationController(rootViewController: communityViewController)
        let settingViewController = SettingViewController()
        settingViewController.title = "Setting"
        let scheduleViewController = ScheduleViewController()
        scheduleViewController.title = "Schedule"
        self.viewControllers = [communityNavigationController, scheduleViewController, settingViewController]
        self.selectedViewController = communityNavigationController
        
        if let items = self.tabBar.items {
            let height = self.tabBar.bounds.height
            
            //Calculate the size of the items
            let numItems = CGFloat(items.count)
            let itemSize = CGSize(
                width: self.tabBar.frame.width / numItems,
                height: self.tabBar.frame.height)
            for (index, _) in items.enumerated() {
                if index > 0 {
                    //Xposition of the item
                    let xPosition = itemSize.width * CGFloat(index)
                    let separator = UIView(frame: CGRect(
                        x: xPosition, y: 0, width: 1.0, height: height))
                    separator.backgroundColor = .gray
                    self.tabBar.insertSubview(separator, at: 1)
                }
            }
        }
    }
}
