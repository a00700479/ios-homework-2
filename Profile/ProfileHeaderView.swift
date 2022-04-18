//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Natali on 16.02.2022.
//

import UIKit


final class ProfileHeaderView: UIView{


   private lazy var imageview: UIImageView = {

        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
              imageView.image = UIImage(named: "cat")
        imageView.layer.cornerRadius = 75
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView

    }()


    private lazy var nameLabel: UILabel = {
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


    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
       button.backgroundColor = .blue
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

        private lazy var textField: UITextField = {
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
        self.drawSelf()
    }
    required init?(coder: NSCoder) {
        fatalError ("init(coder:) has not been implemented")
    }


    private func drawSelf() {

        let imageWidth = imageview.widthAnchor.constraint(equalToConstant: 150)
        let imageHeight = imageview.heightAnchor.constraint(equalToConstant: 150)
        let imageLeading = imageview.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
        let imageTop = imageview.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16)

        self.addSubview(self.imageview)



        let nameLabelTop = nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
        let nameLabelLeading = nameLabel.leadingAnchor.constraint(equalTo: imageview.trailingAnchor, constant: 16)
        let nameLabelTrailing = nameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)

        self.addSubview(nameLabel)

        let statusLabelBottom = statusLabel.bottomAnchor.constraint(equalTo: imageview.bottomAnchor, constant: -16)
        let statusLabelLeading = statusLabel.leadingAnchor.constraint(equalTo: imageview.trailingAnchor, constant: 16)
        let statusLabelTrailing = statusLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)

        self.addSubview(statusLabel)


        let statusButtonHeight = statusButton.heightAnchor.constraint(equalToConstant: 50)
        let statusButtonLeading = statusButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
        let statusButtonTrailing = statusButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        self.statusButtonTop = statusButton.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 16)

        self.addSubview(statusButton)


        let textFieldHeight = textField.heightAnchor.constraint(equalToConstant: 40)
        let textFieldWidth = textField.widthAnchor.constraint(equalToConstant: 200)

        let textFieldTop = textField.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 20)
        let textFieldLeading = textField.leadingAnchor.constraint(equalTo: imageview.trailingAnchor, constant: 16)
        let textFieldTrailing = textField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)

        self.addSubview(textField)

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
            textFieldWidth,
            textFieldHeight,
            textFieldLeading,
            textFieldTrailing

        ].compactMap({ $0 }))
    }


    @objc func buttonPressed() {
        if self.textField.alpha == 0 {

            self.statusButtonTopMoved = self.statusButton.topAnchor.constraint(equalTo: self.imageview.bottomAnchor, constant: 65)

            NSLayoutConstraint.deactivate([self.statusButtonTop].compactMap({$0}))

            NSLayoutConstraint.activate([self.statusButtonTopMoved].compactMap({$0}))

            self.textField.alpha = 1
        } else {
            self.statusButtonTop = self.statusButton.topAnchor.constraint(equalTo: self.imageview.bottomAnchor, constant: 16)

            NSLayoutConstraint.deactivate([self.statusButtonTopMoved].compactMap({$0}))

            NSLayoutConstraint.activate([self.statusButtonTop].compactMap({$0}))
            
            self.textField.alpha = 0
            self.statusLabel.text = self.textField.text
            if self.statusLabel.text == "" {
                self.statusLabel.text = self.statusText
            }
        }
    }
}











