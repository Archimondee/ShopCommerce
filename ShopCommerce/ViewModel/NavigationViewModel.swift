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
  case welcomeView

  case mainTabView
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
    popToPrevious()
    navigationPath.append(destination)
  }

  func resetAndCreateNewDestination(_ destination: NavigationOptions) {
    resetNavigation()
    navigationPath.append(destination)
  }
}
