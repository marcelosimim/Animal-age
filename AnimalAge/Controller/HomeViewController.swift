//
//  HomeViewController.swift
//  AnimalAge
//
//  Created by Marcelo Simim Santos on 11/25/22.
//

import UIKit

class HomeViewController: UIViewController {
    private let customView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
    }
}
