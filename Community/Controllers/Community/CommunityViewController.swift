//
//  CommunityViewController.swift
//  Community
//
//  Created by Kevin Gu on 10/13/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit

class CommunityViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    let communities: [String] = ["Renewal", "Sunnyvale Community Group"]
    let communityId = "communityId"
    
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
    
    let plusImageView: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("+", for: .normal)
        return button
    }()
    
    let noCommunityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You are not in a community"
        label.textAlignment = .center
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let addNavigationButton: UIBarButtonItem = {
        let rightNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        rightNavigationButton.tintColor = .white
        return rightNavigationButton
    }()
    
    let cancelNavigationButton: UIBarButtonItem = {
        let rightNavigationButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(addTapped))
        rightNavigationButton.tintColor = .white
        return rightNavigationButton
    }()
    
    let searchViewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        navigationItem.titleView = inputsContainerView
        setupInputContainerView()
        inputsContainerView.addSubview(searchTextField)
        setupSearchTextfield()
        navigationItem.rightBarButtonItem = addNavigationButton
        collectionView?.backgroundColor = .white
        searchTextField.delegate = self
        
        // Set up collection View
        if communities.count > 0 {
            collectionView?.delegate   = self
            collectionView?.dataSource = self
            collectionView?.register(CommunityCell.self, forCellWithReuseIdentifier: communityId)
        } else {
            collectionView?.addSubview(noCommunityLabel)
            setupNoCommunityLabel()
        }
    }
    
    func setupNoCommunityLabel() {
        noCommunityLabel.centerXAnchor.constraint(equalTo: collectionView!.centerXAnchor).isActive = true
        noCommunityLabel.widthAnchor.constraint(equalTo: collectionView!.widthAnchor, constant: -24).isActive = true
        noCommunityLabel.topAnchor.constraint(equalTo: collectionView!.topAnchor).isActive = true
        noCommunityLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupInputContainerView() {
        inputsContainerView.centerYAnchor.constraint(equalTo: navigationController!.navigationBar.centerYAnchor).isActive = true
        inputsContainerView.leftAnchor.constraint(equalTo: navigationController!.navigationBar.leftAnchor, constant: 12).isActive = true
        inputsContainerView.heightAnchor.constraint(equalTo: navigationController!.navigationBar.heightAnchor, constant:-12).isActive = true
    }
    
    func setupSearchTextfield() {
        searchTextField.leftAnchor.constraint(lessThanOrEqualTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        searchTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        searchTextField.bottomAnchor.constraint(equalTo: inputsContainerView.bottomAnchor).isActive = true
        searchTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    }
    
    func setupSearchContainerView() {
        searchViewContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchViewContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchViewContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc
    func addTapped(_ sender: UIBarButtonItem){
        print(sender.title)
    }
    
    // MARK: CollectionView
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return communities.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: communityId, for: indexPath) as! CommunityCell
        cell.name = communities[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height:50)
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 12)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    }
    
    // MARK: Text View Delegate Functions
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.addSubview(searchViewContainer)
        view.bringSubview(toFront: searchViewContainer)
        setupSearchContainerView()
        navigationItem.rightBarButtonItem = cancelNavigationButton
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
}
