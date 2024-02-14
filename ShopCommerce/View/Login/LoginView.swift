//
//  LoginView.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 12/02/24.
//

import SwiftUI

struct LoginView: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @StateObject var loginVM = LoginViewModel.shared

  var body: some View {
    ZStack {
      Image("bottom_bg")
        .resizable()
        .scaledToFill()
        .frame(width: .screenWidth, height: .screenHeight)
      VStack {
        HStack {
          Button {
            mode.wrappedValue.dismiss()
          } label: {
            Image("back")
              .resizable()
              .scaledToFit()
              .frame(width: 20, height: 20)
          }
          Spacer()
        }
        Spacer()
      }
      .padding(.top, .topInsets)
      .padding(.horizontal, 20)

      VStack {
        Image("color_logo")
          .resizable()
          .scaledToFit()
          .frame(width: 40)
        Spacer()
          .frame(height: .screenWidth * 0.1)

        Text("Login")
          .font(.customfont(.semibold, fontSize: 26))
          .foregroundColor(.primaryText)
          .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
          .padding(.bottom, 4)

        Text("Enter your emails and password")
          .font(.customfont(.semibold, fontSize: 16))
          .foregroundColor(.secondaryText)
          .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
          .padding(.bottom, .screenWidth * 0.1)

        LineTextField(txt: $loginVM.txtEmail, title: "Email", placeholder: "Enter your email address", keyboardType: .emailAddress)
          .padding(.bottom, .screenWidth * 0.07)

        LineSecureField(txt: $loginVM.txtPassword, title: "Password", placeholder: "Enter your password", isShowPassword: $loginVM.isShowPassword)
          .padding(.bottom, .screenWidth * 0.07)

        Button {} label: {
          Text("Forgot Password?")
            .font(.customfont(.medium, fontSize: 14))
            .foregroundColor(.primaryText)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
        .padding(.bottom, .screenWidth * 0.05)

        RoundButton(title: "Log In") {
          loginVM.login { _ in
          }

        }.padding(.bottom, .screenWidth * 0.05)

        HStack {
          Text("Don't have an account?")
            .font(.customfont(.medium, fontSize: 14))
            .foregroundColor(.primaryText)
          Text("Signup")
            .font(.customfont(.medium, fontSize: 14))
            .foregroundColor(.primaryApp)
        }
        Spacer()
      }
      .padding(.top, .topInsets + 64)
      .padding(.horizontal, 20)
      .padding(.bottom, .bottomInsets)
    }
    .alert(isPresented: $loginVM.isError) {
      Alert(title: Text("Error"), message: Text(loginVM.errorMessage), dismissButton: .default(Text("Ok")))
    }
    // .background(Color.white)
    .navigationTitle("")
    .navigationBarBackButtonHidden()
    .toolbar(.hidden)
    .ignoresSafeArea()
  }
}

#Preview {
  LoginView()
}
