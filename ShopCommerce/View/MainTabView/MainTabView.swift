//
//  MainTabView.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 16/02/24.
//

import SwiftUI

struct MainTabView: View {
  @EnvironmentObject private var appVM: AppViewModel
  var body: some View {
    ZStack {
      VStack {
        Text("hello")
        Spacer()
      }
    }
    .navigationTitle("")
    .toolbar(.hidden)
    .ignoresSafeArea()
    .navigationBarBackButtonHidden()
    .interactiveDismissDisabled()
    .onAppear {
      print("hello i am here \(Utils.getUserDefaultObject(key: "user") as? Data)")
      guard let user = Utils.getUserDefaultObject(key: "user") as? Data else {
        print("user empty")
        return
      }

      do {
        let decodedUser = try JSONDecoder().decode(UserModel.self, from: user)
        print("user \(decodedUser.authToken)")

      } catch {
        print("Error \(error.localizedDescription)")
      }
    }
  }
}

#Preview {
  MainTabView()
}
