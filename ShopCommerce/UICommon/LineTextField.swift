//
//  LineTextField.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 12/02/24.
//

import SwiftUI

struct LineTextField: View {
  @Binding var txt: String
  @State var title: String = "Title"
  @State var placeholder: String = "Placeholder"
  @State var keyboardType: UIKeyboardType = .default
  @State var isPassword: Bool = false

  var body: some View {
    VStack {
      Text(title)
        .font(.customfont(.semibold, fontSize: 16))
        .foregroundColor(.textTitle)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 5)

      TextField(placeholder, text: $txt)
        .keyboardType(keyboardType)
        .autocorrectionDisabled(true)
        .frame(height: 40)
        .textInputAutocapitalization(.never)

      Divider()
    }
  }
}

struct LineSecureField: View {
  @Binding var txt: String
  @State var title: String = "Title"
  @State var placeholder: String = "Placeholder"
  @Binding var isShowPassword: Bool

  var body: some View {
    VStack {
      Text(title)
        .font(.customfont(.semibold, fontSize: 16))
        .foregroundColor(.textTitle)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 5)

      if isShowPassword {
        TextField(placeholder, text: $txt)
          .autocorrectionDisabled(true)
          .modifier(ShowButton(isShow: $isShowPassword))
          .frame(height: 40)
          .textInputAutocapitalization(.never)
      } else {
        SecureField(placeholder, text: $txt)
          .modifier(ShowButton(isShow: $isShowPassword))
          .frame(height: 40)
          .textInputAutocapitalization(.never)
      }

      Divider()
    }
  }
}

struct LineTextField_Previews: PreviewProvider {
  @State static var txt: String = ""
  static var previews: some View {
    LineTextField(txt: $txt)
      .padding(20)
  }
}
