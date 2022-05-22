//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Natali on 16.02.2022.
//

import UIKit


final class ProfileHeaderView: UIView{
    
    
    lazy var avatarImageView: UIImageView = {
        
      let imageView = UIImageView()
        imageView.image = UIImage(named: "cat")
        imageView.layer.cornerRadius = 75
        imageView.layer.borderWidth = 3
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
                imageView.layer.borderColor = UIColor.white.cgColor
          imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()

    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Winter Cat"
        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight:.regular)
        label.textColor = .gray
        label.text = statusText
        return label
    }()

    private lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.tintColor = .white
        button.setTitle("Set status", for: .normal)
        button.layer.cornerRadius = 12
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.layer.masksToBounds = true
        textField.backgroundColor = .white
        textField.alpha = 0
        return textField
    }()
    
    private var statusText: String = "Waiting for something..."
    
    private var statusButtonTop: NSLayoutConstraint?
    
    private var statusButtonTopMoved: NSLayoutConstraint?
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        self.statusTextField.delegate = self
        self.drawSelf()
    }
    required init?(coder: NSCoder) {
        fatalError ("init(coder:) has not been implemented")
    }

    private func drawSelf() {
        
        let imageWidth = avatarImageView.widthAnchor.constraint(equalToConstant: 150)
        let imageHeight = avatarImageView.heightAnchor.constraint(equalToConstant: 150)
        let imageLeading = avatarImageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
        let imageTop = avatarImageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16)
        
        self.addSubview(self.avatarImageView)
        
        let nameLabelTop = fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
        let nameLabelLeading = fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16)
        let nameLabelTrailing = fullNameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        
        self.addSubview(fullNameLabel)
        
        let statusLabelBottom = statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -16)
        let statusLabelLeading = statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16)
        let statusLabelTrailing = statusLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        
        self.addSubview(statusLabel)
        
        let statusButtonHeight = setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        let statusButtonLeading = setStatusButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
        let statusButtonTrailing = setStatusButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        self.statusButtonTop = setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16)
        
        self.addSubview(setStatusButton)
        
        let textFieldHeight = statusTextField.heightAnchor.constraint(equalToConstant: 40)
        
        let textFieldTop = statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20)
        let textFieldLeading = statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16)
        let textFieldTrailing = statusTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        
        self.addSubview(statusTextField)
        
        NSLayoutConstraint.activate([
            imageWidth,
            imageHeight,
            imageTop,
            imageLeading,
            
            nameLabelTop,
            nameLabelLeading,
            nameLabelTrailing,
            
            statusLabelBottom,
            statusLabelLeading,
            statusLabelTrailing,
            
            statusButtonTop,
            statusButtonHeight,
            statusButtonLeading,
            statusButtonTrailing,
            
            textFieldTop,
            textFieldHeight,
            textFieldLeading,
            textFieldTrailing
            
        ].compactMap({ $0 }))
    }
        
    @objc func buttonPressed() {
        if self.statusTextField.alpha == 0  {

            self.statusButtonTopMoved = self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 65)

            NSLayoutConstraint.deactivate([self.statusButtonTop].compactMap({$0}))

            NSLayoutConstraint.activate([self.statusButtonTopMoved].compactMap({$0}))

            self.statusTextField.alpha = 1

        } else



        if self.statusTextField.state.isEmpty {
            statusTextField.trigger()

        } else {

            self.statusButtonTop = self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16)

            NSLayoutConstraint.deactivate([self.statusButtonTopMoved].compactMap({$0}))

            NSLayoutConstraint.activate([self.statusButtonTop].compactMap({$0}))

            self.statusTextField.alpha = 0
            self.statusLabel.text = self.statusTextField.text

            if self.statusLabel.text == ""  {

                self.statusLabel.text = self.statusText
                endEditing(true)

            }
        }

//        else {
//
//            self.statusButtonTop = self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16)
//
//            NSLayoutConstraint.deactivate([self.statusButtonTopMoved].compactMap({$0}))
//
//            NSLayoutConstraint.activate([self.statusButtonTop].compactMap({$0}))
//
//            self.statusTextField.alpha = 0
//            self.statusLabel.text = self.statusTextField.text
//
//                    if self.statusLabel.text == ""  {
//                    //    statusTextField.trigger()
//                self.statusLabel.text = self.statusText
//
//
//            }

//                if statusTextField.state.isEmpty {
//                statusTextField.trigger()
//            }


//        guard let status = statusTextField.text else {return}
//        if !status.isEmpty {
//            UIView.animate(withDuration: 0.3) {
//                self.status.text = self.statusTextField.text
//                self.statusTextField.text = .none
//            } completion: { <#Bool#> in
//                <#code#>
//            }
//




    }









  public  func changeTitle(title: String) {
        self.fullNameLabel.text = title
    }

}


extension ProfileHeaderView: UITextFieldDelegate {

func hideKeyboard() {
    self.statusTextField.resignFirstResponder()
}

func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    hideKeyboard()
    return true
}



}






