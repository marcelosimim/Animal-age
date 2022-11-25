//
//  HomeViewController.swift
//  AnimalAge
//
//  Created by Marcelo Simim Santos on 11/25/22.
//

import UIKit

class HomeViewController: UIViewController {
    private let animalImages: [UIImage] = [.little, .medium, .big]
    private var currentImageIndex: Int = 0
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
        if !isLastImage(currentImageIndex) {
            currentImageIndex += 1
            homeView.updateImage(animalImages[currentImageIndex])
        }
    }

    func didTapPrevious() {
        if !isFirstImage(currentImageIndex) {
            currentImageIndex -= 1
            homeView.updateImage(animalImages[currentImageIndex])
        }
    }

    private func isFirstImage(_ index: Int) -> Bool {
        return index == 0
    }

    private func isLastImage(_ index: Int) -> Bool {
        return index == animalImages.count-1
    }
}
