//
//  HomeViewController.swift
//  AnimalAge
//
//  Created by Marcelo Simim Santos on 11/25/22.
//

import UIKit

class HomeViewController: UIViewController {
    private let animalsSize = AnimalSize.allCases
    private var currentType = 0
    private var homeView: HomeViewProtocol = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.delegate = self
    }

    override func loadView() {
        super.loadView()
        view = homeView as? UIView
    }
}

extension HomeViewController: HomeViewDelegate {
    func didChangeType(_ type: AnimalSize) {
        currentType = animalsSize.firstIndex(of: type) ?? 0
        updateView()
    }

    func didChangeYear(_ year: Int) {
        let age = calcuteAge(year)
        updateAge(age)
    }

    func recalculateAge(_ year: Int) {
        let age = calcuteAge(year)
        updateAge(age)
    }

    private func isFirstImage(_ index: Int) -> Bool {
        return index == 0
    }

    private func isLastImage(_ index: Int) -> Bool {
        return index == animalsSize.count-1
    }

    private func getAnimalImage(for type: AnimalSize) -> UIImage {
        switch type {
        case .little:
            return .little
        case .medium:
            return .medium
        case .big:
            return .big
        }
    }

    private func calcuteAge(_ year: Int) -> Double {
        let type = animalsSize[currentType]
        let currentYear = Calendar.current.component(.year, from: Date())
        let age = Double(currentYear - year)

        return age * type.multiplier
    }

    private func updateView() {
        let animalSize = animalsSize[currentType]
        let image = getAnimalImage(for: animalSize)
        homeView.updateView(image: image, text: animalSize.title)
    }

    private func updateAge(_ age: Double) {
        homeView.updateAge(age)
    }
}
