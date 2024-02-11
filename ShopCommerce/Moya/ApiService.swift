//
//  ApiService.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 11/02/24.
//

import Foundation
import Moya

extension APIService: TargetType {
  var baseURL: URL {
    URL(string: "https://reqres.in")!
  }

  var path: String {
    switch self {
    case .fetchTodos:
      return "/todos"
    }
  }

  var method: Moya.Method {
    .get
  }

  var task: Task {
    .requestPlain
  }

  var headers: [String: String]? {
    ["Content-Type": "application/json"]
  }
}
