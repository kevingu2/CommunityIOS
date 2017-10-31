//
//  LoginViewController.swift
//  disclosure
//
//  Created by Kevin Gu on 10/7/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, UITextFieldDelegate, FBSDKLoginButtonDelegate {
    typealias fbGetEmailCompletionHandler = (_ email:String, _ error: String?) -> Void
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Sign in", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        return button
    }()

    let usernameTextfield: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Account"
        let defaults = UserDefaults.standard
        let user_name = defaults.string(forKey: "MyUserName")
        if let name = user_name {
            textField.text = name
        } 
        return textField
    }()
    
    let usernameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, b: 220, g: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextfield: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let passwordSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, b: 220, g: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LoginBackground")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.alpha = 0.3
        return imageView
    }()
    
    let fbLoginButton:FBSDKLoginButton  = {
        let button = FBSDKLoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(inputsContainerView)
        view.addSubview(loginButton)
        view.backgroundColor = .white
        inputsContainerView.addSubview(usernameTextfield)
        inputsContainerView.addSubview(usernameSeparatorView)
        inputsContainerView.addSubview(passwordSeparatorView)
        inputsContainerView.addSubview(passwordTextfield)
        setupInputContainerView()
        setupLoginButton()
        loginButton.addTarget(self, action: #selector(self.login(_:)), for: .touchUpInside)
        usernameTextfield.delegate = self
        passwordTextfield.delegate = self
        backgroundImageView.center = view.center
        view.addSubview(backgroundImageView)
        view.sendSubview(toBack: backgroundImageView)
        setupBackground()
        
        // Setup Facebook button
        view.addSubview(fbLoginButton)
        setupFBLoginButton()
        fbLoginButton.delegate = self
        fbLoginButton.readPermissions = ["email", "public_profile"]
        
        // Add touch gesture
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        view.addGestureRecognizer(tap)
    }
    
    func setupFBLoginButton() {
        fbLoginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        fbLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fbLoginButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant:-24).isActive = true
        fbLoginButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupBackground() {
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func setupLoginButton() {
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant:-24).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupInputContainerView() {
        // Setup input view constraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant:-24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        usernameTextfield.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        usernameTextfield.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        usernameTextfield.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        usernameTextfield.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2).isActive = true
        usernameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        usernameSeparatorView.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor).isActive = true
        usernameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        usernameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        passwordTextfield.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextfield.topAnchor.constraint(equalTo: usernameSeparatorView.topAnchor).isActive = true
        passwordTextfield.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextfield.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2).isActive = true
        passwordSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        passwordSeparatorView.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor).isActive = true
        passwordSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    @objc
    func login(_ sender: UIButton){
        let defaults = UserDefaults.standard
        defaults.setValue(self.usernameTextfield.text?.lowercased(), forKey: "MyUserName")

        //present(CustomedTabBarController(), animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let defaults = UserDefaults.standard
        defaults.setValue(self.usernameTextfield.text?.lowercased(), forKey: "MyUserName")
        //present(CustomedTabBarController(), animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc
    func dismissKeyboard(_ sender: UIButton) {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Facebook Delegates
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            DispatchQueue.main.async {
                let alert = createAlert(title: "Error", msg: "Failed to Login")
                self.present(alert, animated: true, completion: nil)
            }
            return
        }
        getEmailAddress { (email, error) in
            if error != nil {
                print(error as Any)
                DispatchQueue.main.async {
                    let alert = createAlert(title: "Error", msg: "Failed to Login")
                    self.present(alert, animated: true, completion: nil)
                }
                return
            }
            let defaults = UserDefaults.standard
            defaults.setValue(email, forKey: "email")
            DispatchQueue.main.async {
            self.navigationController?.pushViewController(AvailabilityController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
            }
        }
    }
    
    func getEmailAddress(completionHandler: @escaping fbGetEmailCompletionHandler) {
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, error) in
            if error != nil {
                let requestError = "Failed to start graph request \(String(describing: error))"
                completionHandler("", requestError)
            }
            if let dic = result as? Dictionary<String, String> {
                if let email = dic["email"] {
                    completionHandler(email, nil)
                } else{
                    completionHandler("", "No email")
                }
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Facebook Log out")
    }

}

extension UIColor {
    convenience init(r: CGFloat, b: CGFloat, g: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
