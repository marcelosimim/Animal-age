//
//  HomeView.swift
//  AnimalAge
//
//  Created by Marcelo Simim Santos on 11/25/22.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func didTapNext()
    func didTapPrevious()
    func didChangeYear(_ year: Int)
    func recalculateAge(_ year: Int)
}

protocol HomeViewProtocol {
    var delegate: HomeViewDelegate? { get set }

    func updateAge(_ age: Double)
    func updateView(image: UIImage, text: String)
}

class HomeView: UIView, HomeViewProtocol {
    private lazy var animalSizeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .little
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()

    private lazy var animalSizeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.text = "Pequeno"
        label.textColor = .systemYellow
        label.textAlignment = .center
        return label
    }()

    private lazy var nextImageButton: UIButton = {
        let button = UIButton()
        button.setImage(.arrowRight, for: .normal)
        button.tintColor = .green
        button.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        return button
    }()

    private lazy var previousImageButton: UIButton = {
        let button = UIButton()
        button.setImage(.arrowLeft, for: .normal)
        button.tintColor = .blue
        button.addTarget(self, action: #selector(didTapPrevious), for: .touchUpInside)
        return button
    }()

    private lazy var yearOfBirthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.text = "Insira a data de nascimento"
        label.textAlignment = .center
        return label
    }()

    private lazy var yearPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()

    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        return label
    }()

    private var selectedYear = Calendar.current.component(.year, from: Date())
    private var years: [Int] = []
    weak var delegate: HomeViewDelegate?

    override func layoutSubviews() {
        backgroundColor = .white
        addViews()
        addYears()
    }

    private func addViews() {
        addSubviews([animalSizeImage, nextImageButton, previousImageButton, animalSizeLabel, yearOfBirthLabel, yearPicker, ageLabel])

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

            animalSizeLabel.topAnchor.constraint(equalTo: animalSizeImage.bottomAnchor, constant: 32),
            animalSizeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            animalSizeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            yearOfBirthLabel.topAnchor.constraint(equalTo: animalSizeLabel.bottomAnchor, constant: 32),
            yearOfBirthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            yearOfBirthLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            yearPicker.topAnchor.constraint(equalTo: yearOfBirthLabel.bottomAnchor, constant: 8),
            yearPicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            yearPicker.heightAnchor.constraint(equalToConstant: 120),

            ageLabel.topAnchor.constraint(equalTo: yearPicker.bottomAnchor, constant: 16),
            ageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
    }

    @objc private func didTapNext() {
        delegate?.didTapNext()
        delegate?.recalculateAge(selectedYear)
    }

    @objc private func didTapPrevious() {
        delegate?.didTapPrevious()
        delegate?.recalculateAge(selectedYear)
    }

    func updateView(image: UIImage, text: String) {
        animalSizeImage.image = image
        animalSizeLabel.text = text
    }

    func updateAge(_ age: Double) {
        ageLabel.text = "Idade em anos humanos: \(age)"
    }
}

extension HomeView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        years.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(years[row])"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedYear = years[row]
        delegate?.didChangeYear(selectedYear)
    }

    private func addYears() {
        let currentYear = Calendar.current.component(.year, from: Date())
        let firstYear = currentYear - 20

        for i in firstYear...currentYear { years.append(i) }
        yearPicker.selectRow(years.count-1, inComponent: 0, animated: true)
        yearPicker.reloadInputViews()
    }
}
