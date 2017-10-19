//
//  CommunityViewController.swift
//  Community
//
//  Created by Kevin Gu on 10/13/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class CommunityViewController: UIViewController {
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search"
        return textField
    }()
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        navigationItem.titleView = inputsContainerView
        setupInputContainerView()

    }
    
    func setupInputContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: navigationController!.navigationBar.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: navigationController!.navigationBar.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: navigationController!.navigationBar.widthAnchor, constant:-24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalTo: navigationController!.navigationBar.heightAnchor, constant:-12).isActive = true
    }
    
    func setupSearchTextfield() {
        searchTextField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}
