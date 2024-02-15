//
//  APIList.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 11/02/24.
//

import Foundation

enum APIService {
  case login(email: String, password: String)
  case register(username: String, email: String, password: String)
}
