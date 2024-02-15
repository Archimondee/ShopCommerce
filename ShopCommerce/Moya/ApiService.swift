//
//  ApiService.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 11/02/24.
//

import Foundation
import Moya

let provider = MoyaProvider<APIService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])

extension APIService: TargetType {
  var baseURL: URL {
    URL(string: "http://127.0.0.1:3001/api")!
  }

  var path: String {
    switch self {
    case .login:
      return "/app/login"
    case .register:
      return "/app/sign_up"
    }
  }

  var method: Moya.Method {
    switch self {
    case .login, .register:
      return .post
    }
  }

  var task: Task {
    switch self {
    case let .login(email, password):
      return .requestParameters(parameters: ["email": email, "password": password, "dervice_token": ""], encoding: JSONEncoding.default)

    case let .register(username, email, password):
      return .requestParameters(parameters: ["username": username, "email": email, "password": password, "dervice_token": ""], encoding: JSONEncoding.default)
    }
  }

  var headers: [String: String]? {
    switch self {
    case .login, .register:
      return ["Content-Type": "application/json"]
    }
  }
}
