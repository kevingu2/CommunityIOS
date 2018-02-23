//
//  CommunityDetail.swift
//  Community
//
//  Created by Kevin Gu on 10/28/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class CommunityDetailViewController: UIViewController {
    
    public var community: Community! = nil
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    let joinLeaveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = kAppColor
        button.setTitle("Leave Community", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = community.name
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        let description = "Description: "
        let text = "\(description) \(community.details!)"
        
        descriptionLabel.attributedText = addBoldText(fullString: text as NSString, boldPartOfString: description as NSString, font: UIFont.systemFont(ofSize: 15, weight: .regular), boldFont: UIFont.systemFont(ofSize: 20, weight: .bold))
        view.addSubview(descriptionLabel)
        setupDescriptionLabel()
        let userDefaults = UserDefaults()
        let userId = userDefaults.object(forKey: kUserId)
        if let id = userId as? Int64 {
            CommunityManager.hasUser(community: community, userId: id)
            joinLeaveButton.addTarget(self, action: #selector(self.leaveCommunity(_:)), for: .touchUpInside)
            joinLeaveButton.setTitle("Leave Community", for: .normal)
        } else{
            joinLeaveButton.addTarget(self, action: #selector(self.joinCommunity(_:)), for: .touchUpInside)
            joinLeaveButton.setTitle("Join Community", for: .normal)
        }
        view.addSubview(joinLeaveButton)
        setupJoinLeaveButton()
    }
    
    func setupJoinLeaveButton() {
        joinLeaveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        joinLeaveButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        joinLeaveButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        joinLeaveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupDescriptionLabel() {
        let guide = view.safeAreaLayoutGuide
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: Buttons
    @objc
    func leaveCommunity(_ sender: UIButton) {
        let userDefaults = UserDefaults()
        let userId = userDefaults.object(forKey: kUserId)
        do {
            if let id = userId as? Int64 {
                try CommunityManager.leaveCommunity(community: community, userId: id)
                self.navigationController?.popViewController(animated: true)
            }
        } catch MyError.runtimeError(let errorMessage) {
            print(errorMessage)
        }catch {
            
        }
    }
    @objc
    func joinCommunity(_ sender: UIButton) {
        let userDefaults = UserDefaults()
        let userId = userDefaults.object(forKey: kUserId)
        do {
            if let id = userId as? Int64 {
                try CommunityManager.joinCommunity(community: community, userId: id)
                self.navigationController?.popViewController(animated: true)
            }
        } catch MyError.runtimeError(let errorMessage) {
            print(errorMessage)
        }catch {
            
        }
    }
}
