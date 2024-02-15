//
//  AppView.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 11/02/24.
//

import SwiftUI
import NavigationTransitions

struct AppView: View {
  @EnvironmentObject var appVM: AppViewModel
  var body: some View {
    NavigationStack(path: $appVM.navigationPath) {
      WelcomeView()
        .navigationDestination(for: NavigationOptions.self) { route in
          switch route {
          case .signin:
            SigninView()
          case .login:
            LoginView()
          case .signup:
            SignUpView()
          }
        }
    }
    .navigationTransition(.default)
  }
}
