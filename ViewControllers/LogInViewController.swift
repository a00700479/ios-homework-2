//
//  LogInViewController.swift
//  Navigation
//
//  Created by Natali on 20.04.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private let vkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    private lazy var loginPasswordStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginTextField, passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray6
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = "Email or phone"
        textField.layer.borderWidth = 0.5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = "Password"
        textField.layer.borderWidth = 0.5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var invalidLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 8)
        label.numberOfLines = 5
        label.contentMode = .scaleToFill
        label.textAlignment = .center
        label.isHidden = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstraints()
        self.navigationController?.isNavigationBarHidden = true
        
        buttonConfigure()
    }
    
    private func setupViews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(vkImageView)
        contentView.addSubview(loginPasswordStackView)
        contentView.addSubview(logInButton)
        contentView.addSubview(invalidLabel)
    }
    
    private lazy var validationData = ValidationData()
    
    private func validEmail(login: String) -> Bool {
        
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validEmail = NSPredicate(format: "SELF MATCHES %@", emailReg)
        return validEmail.evaluate(with: login)
    }
    
    private func validPassword(password: String) -> Bool {
        
        let passwordReg =  ("(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[@#$%^&*]).{8,}")
        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passwordReg)
        return passwordTesting.evaluate(with: password) && password.count > 6
    }
    
    private func setDelegates() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @objc private func buttonClicked() {
        let profileViewController = ProfileViewController()
        
        guard let login = loginTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        let enteredLogin = validEmail(login: login)
        let enteredPassword = validPassword(password: password)
        if login.isEmpty && password.isEmpty {
            loginTextField.trigger()
            passwordTextField.trigger()
        } else if login.isEmpty {
            loginTextField.trigger()
        } else if password.isEmpty {
            passwordTextField.trigger()
        } else {
            if !enteredPassword && !enteredLogin {
                invalidLabel.text = validationData.invalidEmailAndPassword
                invalidLabel.isHidden = false
                passwordTextField.trigger()
                loginTextField.trigger()
            } else if !enteredPassword {
                invalidLabel.text = validationData.invalidPassword
                invalidLabel.isHidden = false
                passwordTextField.trigger()
            } else if !enteredLogin {
                invalidLabel.text = validationData.invalidEmail
                invalidLabel.isHidden = false
                loginTextField.trigger()
                
            } else {
                if (enteredLogin && enteredPassword) && (loginTextField.text != validationData.defaultLogin || passwordTextField.text != validationData.defaultPassword) {
                    let alert = UIAlertController(title: "Invalid login or password", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                } else {
                    navigationController?.pushViewController(profileViewController, animated: true)
                    invalidLabel.isHidden = true
                }
            }
        }
    }
}

extension LogInViewController {
    
    private func setConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints.append(contentView.topAnchor.constraint(equalTo: scrollView.topAnchor))
        constraints.append(contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor))
        constraints.append(contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor))
        constraints.append(contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor))
        constraints.append(contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor))
        
        constraints.append(loginPasswordStackView.topAnchor.constraint(lessThanOrEqualTo: vkImageView.bottomAnchor, constant: 120))
        constraints.append(loginPasswordStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor))
        let leadingStackConstraint = loginPasswordStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let trailingStackConstraint = loginPasswordStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        leadingStackConstraint.priority = UILayoutPriority(999)
        trailingStackConstraint.priority = UILayoutPriority(999)
        constraints.append(leadingStackConstraint)
        constraints.append(trailingStackConstraint)
        
        constraints.append(vkImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        constraints.append(vkImageView.widthAnchor.constraint(equalToConstant: 100))
        constraints.append(vkImageView.heightAnchor.constraint(equalToConstant: 100))
        constraints.append(vkImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120))
        
        constraints.append(logInButton.topAnchor.constraint(equalTo: self.loginPasswordStackView.bottomAnchor, constant: 20))
        constraints.append(logInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        constraints.append(logInButton.widthAnchor.constraint(equalToConstant: 350))
        constraints.append(logInButton.heightAnchor.constraint(equalToConstant: 50))
        let loginButtonBottomAnchor = logInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        loginButtonBottomAnchor.priority = UILayoutPriority(999)
        constraints.append(loginButtonBottomAnchor)
        
        constraints.append(invalidLabel.topAnchor.constraint(equalTo: loginPasswordStackView.bottomAnchor, constant: 3))
        constraints.append(invalidLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        constraints.append(invalidLabel.widthAnchor.constraint(equalToConstant: 300))
        
        NSLayoutConstraint.activate(constraints)
        
        for view in loginPasswordStackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 350),
                view.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
}

extension LogInViewController: UITextFieldDelegate {

    func hideKeyboard() {
        self.loginTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
}

extension LogInViewController {
    func buttonConfigure() {

        switch logInButton.state {

        case .selected:
            logInButton.alpha = 0.8
        case .normal:
            logInButton.alpha = 1
        case .highlighted:
            logInButton.alpha = 0.8
        case .disabled:
            logInButton.alpha = 0.8
        default:
            logInButton.alpha = 1
        }
    }
}


