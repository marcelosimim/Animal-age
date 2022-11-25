//
//  HomeView.swift
//  AnimalAge
//
//  Created by Marcelo Simim Santos on 11/25/22.
//

import UIKit

class HomeView: UIView {
    private lazy var animalSizeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .little
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()

    private lazy var nextImageButton: UIButton = {
        let button = UIButton()
        button.setImage(.arrowRight, for: .normal)
        button.tintColor = .green
        return button
    }()

    private lazy var previousImageButton: UIButton = {
        let button = UIButton()
        button.setImage(.arrowLeft, for: .normal)
        button.tintColor = .blue
        return button
    }()

    override func layoutSubviews() {
        backgroundColor = .yellow
        addViews()
    }

    private func addViews() {
        addSubviews([animalSizeImage, nextImageButton, previousImageButton])

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            animalSizeImage.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            animalSizeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            animalSizeImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            animalSizeImage.heightAnchor.constraint(equalToConstant: 250),

            nextImageButton.centerYAnchor.constraint(equalTo: animalSizeImage.centerYAnchor),
            nextImageButton.leadingAnchor.constraint(equalTo: animalSizeImage.trailingAnchor, constant: 16),

            previousImageButton.centerYAnchor.constraint(equalTo: animalSizeImage.centerYAnchor),
            previousImageButton.trailingAnchor.constraint(equalTo: animalSizeImage.leadingAnchor, constant: -16),
        ])
    }
}
