//
//  BaseViewController.swift
//  SolutisSW2023
//
//  Created by Gabriel Roveri on 03/05/23.
//

import Foundation
import UIKit

protocol BaseViewControllerProtocol: AnyObject {
    func showLoading(title: String)
    func hideLoading()
    func showError(_ error: ServiceError)
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    var rootViewController: UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController
    }

    func showLoading(title: String = "Carregando") {
        let alert = UIAlertController(title: nil, message: title, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()

        alert.view.addSubview(loadingIndicator)
        var nearestAvailablePresenter: UIViewController? {
            guard let root = rootViewController else {
                return nil
            }
            if root.presentedViewController == nil {
                return root
            } else if let parent = parent {
                return parent
            } else {
                return self
            }
        }

        nearestAvailablePresenter?.present(alert, animated: true, completion: nil)
    }

    func hideLoading() {
        dismiss(animated: false)
    }

    func showError(_ error: ServiceError) {
        let alert = UIAlertController(title: nil, message: title, preferredStyle: .alert)
        // TODO: Show alert controller when an error occurs
    }
}
