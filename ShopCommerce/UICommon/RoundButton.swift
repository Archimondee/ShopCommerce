//
//  RoundButton.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 12/02/24.
//

import SwiftUI

struct RoundButton: View {
  @State var title: String = "Title"
  var didTap: (() -> Void)?

  var body: some View {
    Button {
      didTap?()
    } label: {
      Text(title)
        .font(.customfont(.semibold, fontSize: 18))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
    }
    
    //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
    .background(Color.primaryApp)
    .cornerRadius(20)
  }
}

#Preview {
  RoundButton()
    .padding(20)
}
