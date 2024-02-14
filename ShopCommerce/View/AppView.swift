//
//  AppView.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 11/02/24.
//

import SwiftUI

class AppViewModel: ObservableObject {
  @Published var navigationPath = NavigationPath()

  func navigateTo(_ destination: NavigationOptions) {
    navigationPath.append(destination)
  }

  func popToPrevious() {
    navigationPath.removeLast()
  }

  func resetNavigation() {
    navigationPath.removeLast(navigationPath.count)
  }
}

enum NavigationOptions: Hashable {
  case login
}

struct AppView: View {
  @StateObject private var appVM = AppViewModel()
  var body: some View {
    NavigationStack(path: $appVM.navigationPath) {
      WelcomeView()
        .navigationDestination(for: NavigationOptions.self) { route in
          switch route {
          case .login: LoginView()
          }
        }
        .environmentObject(appVM)
    }
  }
}
