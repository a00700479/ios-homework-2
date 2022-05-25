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
        status.backgroundColor = .systemGray5
        status.font = .systemFont(ofSize: 20)
        status.textColor = .systemGray
        status.text = " status"
        status.layer.cornerRadius = 7
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Waiting with something..."
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 0.5
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 14)
        textField.textColor = .systemGray
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 7
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    } ()

    private lazy var showButton: UIButton = {
        let showButton = UIButton(type: .system)
        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.setTitle("Set status", for: .normal)
        showButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        showButton.layer.cornerRadius = 7
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        showButton.layer.shadowRadius = 5
        showButton.layer.shadowOpacity = 0.3
        showButton.translatesAutoresizingMaskIntoConstraints = false
        return showButton
    }()

    lazy var avatarImage: UIImageView = {
        let cat = UIImage(named: "cat")
        let avatarImage = UIImageView(image: cat)
        avatarImage.layer.shadowColor = UIColor.black.cgColor
        avatarImage.layer.shadowOffset = CGSize(width: 10, height: 10)
        avatarImage.layer.shadowRadius = 10
        avatarImage.layer.shadowOpacity = 0.3
        avatarImage.isUserInteractionEnabled = true
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    } ()

    @objc func buttonPressed() {
        guard let status = textField.text else {return}
        if !status.isEmpty {
            UIView.animate(withDuration: 0.3) {
                self.status.text = self.textField.text
                self.textField.text = .none
            } completion: { _ in
            }
        }
        if status.isEmpty {
            textField.trigger()
        }
        endEditing(true)
    }

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

    private func addConstraints() {

        self.addSubview(stackView)
        stackView.addArrangedSubview(avatarImage)
        stackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(name)
        labelStackView.addArrangedSubview(status)
        labelStackView.addArrangedSubview(textField)
        labelStackView.addArrangedSubview(showButton)

        var constraints = [NSLayoutConstraint]()

        constraints.append(stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        constraints.append(stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10))
        constraints.append(stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20))
        constraints.append(stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25))

        NSLayoutConstraint.activate(constraints)
    }
}

//
//    lazy var avatarImageView: UIImageView = {
//
//      let imageView = UIImageView()
//        imageView.image = UIImage(named: "cat")
//        imageView.layer.cornerRadius = 75
//        imageView.layer.borderWidth = 3
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//                imageView.layer.borderColor = UIColor.white.cgColor
//          imageView.isUserInteractionEnabled = true
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//
//    }()
//
//    private lazy var fullNameLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        label.text = "Winter Cat"
//        return label
//    }()
//
//    private lazy var statusLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 14, weight:.regular)
//        label.textColor = .gray
//        label.text = statusText
//        return label
//    }()
//
//    private lazy var setStatusButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .blue
//        button.tintColor = .white
//        button.setTitle("Set status", for: .normal)
//        button.layer.cornerRadius = 12
//        button.layer.shadowOffset.width = 4
//        button.layer.shadowOffset.height = 4
//        button.layer.shadowRadius = 4
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOpacity = 0.7
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        return button
//    }()
//
//    lazy var statusTextField: UITextField = {
//        let textField = UITextField()
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
//        textField.textColor = .black
//        textField.layer.borderWidth = 1
//        textField.layer.borderColor = UIColor.black.cgColor
//        textField.layer.cornerRadius = 12
//        textField.layer.masksToBounds = true
//        textField.backgroundColor = .white
//        textField.alpha = 0
//        return textField
//    }()
//
//
//    private var statusText: String = "Waiting for something..."
//
//    private var statusButtonTop: NSLayoutConstraint?
//
//    private var statusButtonTopMoved: NSLayoutConstraint?
//
//
//    override init (frame: CGRect) {
//        super.init(frame: frame)
//        self.statusTextField.delegate = self
//        self.drawSelf()
//    }
//    required init?(coder: NSCoder) {
//        fatalError ("init(coder:) has not been implemented")
//    }
//
//    private func drawSelf() {
//
//        let imageWidth = avatarImageView.widthAnchor.constraint(equalToConstant: 150)
//        let imageHeight = avatarImageView.heightAnchor.constraint(equalToConstant: 150)
//        let imageLeading = avatarImageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
//        let imageTop = avatarImageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16)
//
//        self.addSubview(self.avatarImageView)
//
//        let nameLabelTop = fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
//        let nameLabelLeading = fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16)
//        let nameLabelTrailing = fullNameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
//
//        self.addSubview(fullNameLabel)
//
//        let statusLabelBottom = statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -16)
//        let statusLabelLeading = statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16)
//        let statusLabelTrailing = statusLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
//
//        self.addSubview(statusLabel)
//
//        let statusButtonHeight = setStatusButton.heightAnchor.constraint(equalToConstant: 50)
//        let statusButtonLeading = setStatusButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
//        let statusButtonTrailing = setStatusButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
//        self.statusButtonTop = setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16)
//
//        self.addSubview(setStatusButton)
//
//        let textFieldHeight = statusTextField.heightAnchor.constraint(equalToConstant: 40)
//
//        let textFieldTop = statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20)
//        let textFieldLeading = statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16)
//        let textFieldTrailing = statusTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
//
//        self.addSubview(statusTextField)
//
//        NSLayoutConstraint.activate([
//            imageWidth,
//            imageHeight,
//            imageTop,
//            imageLeading,
//
//            nameLabelTop,
//            nameLabelLeading,
//            nameLabelTrailing,
//
//            statusLabelBottom,
//            statusLabelLeading,
//            statusLabelTrailing,
//
//            statusButtonTop,
//            statusButtonHeight,
//            statusButtonLeading,
//            statusButtonTrailing,
//
//            textFieldTop,
//            textFieldHeight,
//            textFieldLeading,
//            textFieldTrailing
//
//        ].compactMap({ $0 }))
//    }
//
//    @objc func buttonPressed() {
//        if self.statusTextField.alpha == 0 {
//
//            self.statusButtonTopMoved = self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 65)
//
//            NSLayoutConstraint.deactivate([self.statusButtonTop].compactMap({$0}))
//
//            NSLayoutConstraint.activate([self.statusButtonTopMoved].compactMap({$0}))
//
//            self.statusTextField.alpha = 1
//
//        }
//        else {
//            self.statusButtonTop = self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16)
//
//            NSLayoutConstraint.deactivate([self.statusButtonTopMoved].compactMap({$0}))
//
//            NSLayoutConstraint.activate([self.statusButtonTop].compactMap({$0}))
//
//            self.statusTextField.alpha = 0
//
//            self.statusLabel.text = self.statusTextField.text
//            if self.statusLabel.text == "" {
//                NSLayoutConstraint.deactivate([self.statusButtonTop].compactMap({$0}))
//
//                NSLayoutConstraint.activate([self.statusButtonTopMoved].compactMap({$0}))
//                self.statusTextField.alpha = 1
//                statusTextField.trigger()
//
//                self.statusLabel.text = self.statusText
//
//            }
//        }
//    }
//
//  public  func changeTitle(title: String) {
//        self.fullNameLabel.text = title
//    }
//
//}
//
//extension ProfileHeaderView: UITextFieldDelegate {
//
//func hideKeyboard() {
//    self.statusTextField.resignFirstResponder()
//}
//
//func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//    hideKeyboard()
//    return true
//}
//
//
//
//}






