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
        
        let communityViewController = CommunityViewController()
        communityViewController.title = "Community"
        let settingViewController = SettingViewController()
        settingViewController.title = "Setting"
        let scheduleViewController = ScheduleViewController()
        scheduleViewController.title = "Schedule"
        self.viewControllers = [communityViewController, scheduleViewController, settingViewController]
        self.selectedViewController = communityViewController
        self.navigationItem.hidesBackButton = true
        
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
                        x: xPosition, y: 0, width: 2.0, height: height))
                    separator.backgroundColor = .gray
                    self.tabBar.insertSubview(separator, at: 1)
                }
            }
        }
    }
}
