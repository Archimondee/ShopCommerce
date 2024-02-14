//
//  UserModel.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 14/02/24.
//

import SwiftUI

struct UserModel: Decodable {
  var id: Int = 0
  var username: String = ""
  var name: String = ""
  var email: String = ""
  var mobile: String = ""
  var mobileCode: String = ""
  var authToken: String = ""

  enum CodingKeys: String, CodingKey {
    case user_id
    case username
    case name
    case email
    case mobile
    case mobile_code
    case auth_token
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(Int.self, forKey: .user_id) ?? 0
    username = try container.decodeIfPresent(String.self, forKey: .username) ?? ""
    name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
    mobile = try container.decodeIfPresent(String.self, forKey: .mobile) ?? ""
    mobileCode = try container.decodeIfPresent(String.self, forKey: .mobile_code) ?? ""
    authToken = try container.decodeIfPresent(String.self, forKey: .auth_token) ?? ""
  }
}
