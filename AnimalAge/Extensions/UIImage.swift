//
//  UIImage.swift
//  AnimalAge
//
//  Created by Marcelo Simim Santos on 11/25/22.
//

import UIKit

extension UIImage {
    static func imageBuilder(name: String) -> UIImage {
        UIImage(named: name) ?? .remove
    }

    static func imageBuilder(systemName: String) -> UIImage {
        UIImage(systemName: systemName) ?? .remove
    }

    static var arrowLeft: UIImage { imageBuilder(systemName: "arrow.left") }
    static var arrowRight: UIImage { imageBuilder(systemName: "arrow.right") }
    static var big: UIImage { imageBuilder(name: "big") }
    static var medium: UIImage { imageBuilder(name: "medium") }
    static var little: UIImage { imageBuilder(name: "little") }

}
