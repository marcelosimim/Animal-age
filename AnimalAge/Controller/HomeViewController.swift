//
//  HomeViewController.swift
//  AnimalAge
//
//  Created by Marcelo Simim Santos on 11/25/22.
//

import UIKit

class HomeViewController: UIViewController {
    private let animalsSize: [AnimalSize] = [.little, .medium, .big]
    private var currentType: Int = 0
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
    func didTapNext() {
        if !isLastImage(currentType) {
            currentType += 1
            updateView()
        }
    }

    func didTapPrevious() {
        if !isFirstImage(currentType) {
            currentType -= 1
            updateView()
        }
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
        var age:Double = Double(currentYear - year)

        if type == .little { age *= 6 }
        else if type == .medium { age *= 7 }
        else if type == .big { age *= 7.5 }

        return age
    }

    private func updateView() {
        let animalSize = animalsSize[currentType]
        let image = getAnimalImage(for: animalSize)
        homeView.updateView(image: image, text: animalSize.rawValue)
    }

    private func updateAge(_ age: Double) {
        homeView.updateAge(age)
    }
}
