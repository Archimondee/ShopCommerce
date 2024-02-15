//
//  WelcomeView.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 11/02/24.
//

import SwiftUI

struct WelcomeView: View {
  @EnvironmentObject var appVM: AppViewModel
  var body: some View {
    ZStack {
      Image("welcom_bg")
        .resizable()
        .scaledToFill()
        .frame(width: .screenWidth, height: .screenHeight)

      VStack {
        Spacer()

        Image("app_logo")
          .resizable()
          .scaledToFit()
          .frame(width: 60, height: 60)
          .padding(.bottom, 8)

        Text("Welcome \nto our store")
          .font(.customfont(.semibold, fontSize: 48))
          .foregroundColor(.white)
          .multilineTextAlignment(.center)

        Text("Get you groceries in as fast as one hour")
          .font(.customfont(.semibold, fontSize: 16))
          .foregroundColor(.white.opacity(0.7))
          .multilineTextAlignment(.center)
          .padding(.bottom, 30)

        RoundButton(title: "Get Started") {
          appVM.navigateTo(.signin)
        }

        Spacer()
          .frame(height: 80)
      }
      .padding(.horizontal, 20)
    }

    .navigationTitle("")
    .navigationBarBackButtonHidden()
    .toolbar(.hidden)
    .ignoresSafeArea(.all)
  }
}

#Preview {
  NavigationView {
    WelcomeView()
  }
}
