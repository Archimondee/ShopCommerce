//
//  NavigationControllerExtension.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 15/02/24.
//

import Foundation
import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
  override open func viewDidLoad() {
    super.viewDidLoad()
    interactivePopGestureRecognizer?.delegate = self
  }

  public func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {
    return viewControllers.count > 1
  }
}
