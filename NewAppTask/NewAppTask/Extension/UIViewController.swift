//
//  UIViewController.swift
//  NewAppTask
//
//  Created by Mac on 21/09/23.
//

import Foundation
import UIKit

extension UIViewController {
    func hidekeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dissmisskeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dissmisskeyboard() {
        view.endEditing(true)
    }
}
