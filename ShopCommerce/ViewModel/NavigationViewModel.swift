//
//  NavigationViewModel.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 14/02/24.
//

import Foundation
import SwiftUI

enum NavigationOptions: Hashable {
  case login
  case signup
  case signin
}

class AppViewModel: ObservableObject {
  static var shared: AppViewModel = .init()
  @Published var navigationPath: [NavigationOptions] = []

  func navigateTo(_ destination: NavigationOptions) {
    navigationPath.append(destination)
  }

  func popToPrevious() {
    navigationPath.removeLast()
  }

  func resetNavigation() {
    navigationPath.removeLast(navigationPath.count)
  }

  func replaceNavigation(_ destination: NavigationOptions) {
    var newArray = navigationPath
    newArray[navigationPath.count - 1] = destination
    navigationPath = newArray
  }
}
