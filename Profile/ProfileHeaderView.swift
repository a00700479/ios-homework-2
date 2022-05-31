//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Natali on 16.02.2022.
//

import UIKit


class ProfileHeaderView: UIView {
    
    private lazy var name: UILabel = {
        let name = UILabel()
        name.text = "Winter Cat"
        name.font = .systemFont(ofSize: 18, weight: .bold)
        name.adjustsFontSizeToFitWidth = true
        name.minimumScaleFactor = 0.5
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var status: UITextView = {
        let status = UITextView()
        status.backgroundColor = .clear
        status.font = .systemFont(ofSize: 14)
        status.textColor = .systemGray
        status.text = "Waiting for something"
        status.layer.cornerRadius = 7
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Set your status.."
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 0.5
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 14)
        textField.textColor = .systemGray
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 7
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    } ()
    
  lazy var showButton: UIButton = {
        let showButton = UIButton(type: .system)
        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.setTitle("Set status", for: .normal)
        showButton.backgroundColor = .systemBlue
        showButton.tintColor = .white
        showButton.layer.cornerRadius = 12
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showButton.layer.shadowRadius = 4
        showButton.layer.shadowOpacity = 0.7
        showButton.translatesAutoresizingMaskIntoConstraints = false
        return showButton
    }()
    
    lazy var avatarImage: UIImageView = {
        let cat = UIImage(named: "cat")
        let avatarImage = UIImageView(image: cat)
        avatarImage.layer.cornerRadius = 75
        avatarImage.layer.shadowColor = UIColor.black.cgColor
        avatarImage.layer.shadowOffset = CGSize(width: 10, height: 10)
        avatarImage.layer.shadowRadius = 10
        avatarImage.layer.shadowOpacity = 0.3
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.layer.borderWidth = 3
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.clipsToBounds = true
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.isUserInteractionEnabled = true
        return avatarImage
    } ()

    private lazy var labelStackView: UIStackView = {
        let labelstackView = UIStackView()
        labelstackView.axis = .vertical
        labelstackView.distribution = .fillEqually
        labelstackView.spacing = 15
        labelstackView.translatesAutoresizingMaskIntoConstraints = false
        return labelstackView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 45
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func buttonPressed() {

        guard let statusx = textField.text else {return}

        if !statusx.isEmpty {
            UIView.animate(withDuration: 0.3) {
                 self.status.text = self.textField.text

                self.textField.text = .none
            } completion: { _ in
            }
        }

        if statusx.isEmpty {
           
            textField.trigger()
        }
        endEditing(true)
    }
    


    private func addConstraints() {
        
        self.addSubview(stackView)

        stackView.addArrangedSubview(avatarImage)
        stackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(name)
        labelStackView.addArrangedSubview(status)
        labelStackView.addArrangedSubview(textField)
        labelStackView.addArrangedSubview(showButton)
        self.addSubview(showButton)

        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(avatarImage.widthAnchor.constraint(equalToConstant: 150))
        constraints.append(avatarImage.heightAnchor.constraint(equalToConstant: 150))

        constraints.append(stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        constraints.append(stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10))
        constraints.append(stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20))
        constraints.append(stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80))

        constraints.append(showButton.heightAnchor.constraint(equalToConstant: 50))
       constraints.append(showButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16))
//        constraints.append(showButton.topAnchor.constraint(equalTo: topAnchor, constant: 36))
       constraints.append(showButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16))
        constraints.append(showButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16))
        
        NSLayoutConstraint.activate(constraints)
    }
}
