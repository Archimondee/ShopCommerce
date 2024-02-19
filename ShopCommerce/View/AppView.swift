//
//  AppView.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 11/02/24.
//

import NavigationTransitions
import SwiftUI

struct AppView: View {
  @EnvironmentObject var appVM: AppViewModel
  var body: some View {
    NavigationStack(path: $appVM.navigationPath) {
      WelcomeView()
        .onAppear {
          guard let user = Utils.getUserDefaultObject(key: "user") as? Data else {
            return
          }

          do {
            let decodedUser = try JSONDecoder().decode(UserModel.self, from: user)
            print("user \(decodedUser.authToken)")
            if !decodedUser.authToken.isEmpty {
              self.appVM.navigationPath = [.mainTabView]
            }
          } catch {
            print("Error \(error.localizedDescription)")
          }
        }
        .navigationDestination(for: NavigationOptions.self) { route in
          switch route {
          case .signin:
            SigninView()
          case .login:
            LoginView()
          case .signup:
            SignUpView()
          case .mainTabView:
            MainTabView()
          case .welcomeView:
            WelcomeView()
          }
        }
    }
    .navigationTransition(.default)
  }
}
