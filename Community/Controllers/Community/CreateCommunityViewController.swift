//
//  AddCommunityViewController.swift
//  Community
//
//  Created by Kevin Gu on 10/30/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class CreateCommunityViewController: UIViewController {
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.layer.borderWidth = 2.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Create a Community"
        view.addSubview(inputsContainerView)
        setupInputContainerView()
    }
    
    func setupInputContainerView() {
        // Setup input view constraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant:-24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
