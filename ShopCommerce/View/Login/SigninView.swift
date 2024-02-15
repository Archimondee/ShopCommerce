//
//  SigninView.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 12/02/24.
//

import CountryPicker
import SwiftUI

struct SigninView: View {
  @State var txtMobile: String = ""
  @State var isShowPicker: Bool = false
  @State var countryObj: Country?

  @EnvironmentObject private var appVM: AppViewModel

  var body: some View {
    ZStack {
      Image("bottom_bg")
        .resizable()
        .scaledToFill()
        .frame(width: .screenWidth, height: .screenHeight)

      VStack {
        Image("sign_in_top")
          .resizable()
          .scaledToFill()
          .frame(width: .screenWidth, height: .screenWidth)
        Spacer()
      }

      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading) {
          Text("Get your groceries\n with nectar")
            .font(.customfont(.semibold, fontSize: 26))
            .foregroundColor(.primaryText)
            .multilineTextAlignment(.leading)
            .padding(.bottom, 25)

          HStack {
            Button {
              isShowPicker = true
            } label: {
              if let countryObj = countryObj {
                Text("\(countryObj.isoCode.getFlag())")
                  .font(.customfont(.medium, fontSize: 20))
                  .foregroundColor(.primaryText)
                Text("+ \(countryObj.phoneCode)")
                  .font(.customfont(.medium, fontSize: 18))
                  .foregroundColor(.primaryText)
              }
            }
            TextField("Enter mobile phone", text: $txtMobile)
              .frame(minWidth: 0, maxWidth: .infinity)
          }

          RoundButton(title: "Continue with Email Sign In", btnColor: Color(hex: "5383EC")) {
            appVM.navigateTo(.login)
          }.padding(.top, 20).padding(.bottom, .screenWidth * 0.02)
          RoundButton(title: "Continue with Email Sign Up") {
            appVM.navigateTo(.signup)
          }.padding(.bottom, .screenWidth * 0.05)

          Divider()
            .padding(.bottom, 25)

          Text("Or connect with social media")
            .font(.customfont(.semibold, fontSize: 14))
            .foregroundColor(.textTitle)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .padding(.bottom, 25)

          Button {} label: {
            Image("google_logo")
              .resizable()
              .scaledToFit()
              .frame(width: 20, height: 20)
            Text("Continue with Google")
              .font(.customfont(.semibold, fontSize: 18))
              .foregroundColor(.white)

              .multilineTextAlignment(.center)
          }
          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
          .background(Color(hex: "5383EC"))
          .cornerRadius(20)
          .padding(.bottom, 8)

          Button {} label: {
            Image("fb_logo")
              .resizable()
              .scaledToFit()
              .frame(width: 20, height: 20)
            Text("Continue with Facebook")
              .font(.customfont(.semibold, fontSize: 18))
              .foregroundColor(.white)

              .multilineTextAlignment(.center)
          }
          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
          .background(Color(hex: "4A66AC"))
          .cornerRadius(20)
        }
        .padding(.horizontal, 20)
        .frame(width: .screenWidth, alignment: .leading)
        .padding(.top, .topInsets + .screenWidth * 0.55)
      }
    }
    .onAppear {
      self.countryObj = Country(phoneCode: "62", isoCode: "ID")
    }
    .sheet(isPresented: $isShowPicker, content: {
      CountryPickerUI(country: $countryObj)
    })
    .navigationTitle("")
    //.navigationBarBackButtonHidden()
    .toolbar(.hidden)
    .ignoresSafeArea()
    
  }
}

#Preview {
  SigninView()
}
