//
//  SignUpView.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 14/02/24.
//

import SwiftUI

struct SignUpView: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @EnvironmentObject private var appVM: AppViewModel
  @StateObject var loginVM = LoginViewModel.shared

  var body: some View {
    ZStack {
      Image("bottom_bg")
        .resizable()
        .scaledToFill()
        .frame(width: .screenWidth, height: .screenHeight)

      ScrollView {
        VStack {
          Image("color_logo")
            .resizable()
            .scaledToFit()
            .frame(width: 40)
            .padding(.bottom, .screenWidth * 0.1)

          Text("Sign Up")
            .font(.customfont(.semibold, fontSize: 26))
            .foregroundColor(.primaryText)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 4)

          Text("Enter your credentials to continue")
            .font(.customfont(.semibold, fontSize: 16))
            .foregroundColor(.secondaryText)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, .screenWidth * 0.1)

          LineTextField(txt: $loginVM.txtUsername, title: "Username", placeholder: "Enter your username", keyboardType: .default)
            .padding(.bottom, .screenWidth * 0.07)

          LineTextField(txt: $loginVM.txtEmail, title: "Email", placeholder: "Enter your email address", keyboardType: .emailAddress)
            .padding(.bottom, .screenWidth * 0.07)

          LineSecureField(txt: $loginVM.txtPassword, title: "Password", placeholder: "Enter your password", isShowPassword: $loginVM.isShowPassword)
            .padding(.bottom, .screenWidth * 0.04)

          VStack {
            Text("By continuing you agree to our")
              .font(.customfont(.medium, fontSize: 14))
              .foregroundColor(.secondaryText)
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

            HStack {
              Text("Terms of Service")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.primaryApp)

              Text(" and ")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.secondaryText)

              Text("Privacy Policy.")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.primaryApp)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, .screenWidth * 0.02)
          }

          RoundButton(title: "Sign Up") {
            loginVM.register { completion in
              DispatchQueue.main.async {
                switch completion {
                case .success:
                  loginVM.txtEmail = ""
                  loginVM.txtPassword = ""
                  loginVM.txtUsername = ""

                  loginVM.showAlert = true
                  loginVM.showMessage = "Register Success"
                  loginVM.showAlertTitle = "Success"
                case let .failure(error):
                  loginVM.showMessage = error.localizedDescription
                  loginVM.showAlert = true
                  loginVM.showAlertTitle = "Error"
                }
              }
            }
          }
          .padding(.bottom, .screenWidth * 0.05)

          HStack {
            Text("Alredy have an account?")
              .font(.customfont(.semibold, fontSize: 14))
              .foregroundColor(.primaryText)

            Text("Sign In")
              .font(.customfont(.semibold, fontSize: 14))
              .foregroundColor(.primaryApp)
              .onTapGesture {
                appVM.replaceNavigation(.login)
              }
          }

          Spacer()
        }
        .padding(.top, .topInsets + 64)
        .padding(.horizontal, 20)
        .padding(.bottom, .bottomInsets)
      }

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
    }
    .alert(isPresented: $loginVM.showAlert, content: {
      Alert(title: Text(loginVM.showAlertTitle), message: Text(loginVM.showMessage), dismissButton: .default(Text("Ok")))
    })
    .navigationTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
    .ignoresSafeArea()
  }
}

#Preview {
  SignUpView()
}
