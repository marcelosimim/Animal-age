//
//  UIView.swift
//  AnimalAge
//
//  Created by Marcelo Simim Santos on 11/25/22.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
       for view in views {
           addSubview(view)
           view.translatesAutoresizingMaskIntoConstraints = false
       }
   }
}
