//
//  LoginViewModel.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 12/02/24.
//

import Combine
import Foundation
import Moya
import SwiftUI

class LoginViewModel: ObservableObject {
  static var shared: LoginViewModel = .init()

  private var cancellables = Set<AnyCancellable>()

  @Published var txtUsername: String = ""
  @Published var txtEmail: String = ""
  @Published var txtPassword: String = ""
  @Published var isShowPassword: Bool = false

  @Published var user: UserModel? = nil

  @Published var isLoading = false

  @Published var showAlertTitle = ""
  @Published var showMessage = ""
  @Published var showAlert = false

  func login(completion: @escaping (Result<UserModel?, Error>) -> Void?) {
    if !txtEmail.isValidEmail {
      showAlertTitle = "Error"
      showMessage = "Please enter valid email address"
      showAlert = true
      return
    }

    if txtPassword.isEmpty {
      showAlertTitle = "Error"
      showMessage = "Please enter password"
      showAlert = true
      return
    }
    provider.requestPublisher(.login(email: txtEmail.lowercased(), password: txtPassword))
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { completion in
        guard case let .failure(error) = completion else { return }
        print("Login error : \(error.localizedDescription)")
      }, receiveValue: { response in
        do {
          let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any]
          guard let status = json?["status"] as? String, status != "0" else {
            let message = json?["message"] as? String
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: message!])
            self.showAlert = true
            self.showAlertTitle = "Error"
            self.showMessage = error.localizedDescription
            completion(.failure(error))
            return
          }

          guard let payload = json?["payload"] as? [String: Any] else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Oops! Something went wrong"])
            self.showAlert = true
            self.showAlertTitle = "Error"
            self.showMessage = error.localizedDescription
            completion(.failure(error))
            return
          }

          Utils.setUserDefault(data: payload, key: "user")

          self.user = try JSONDecoder().decode(UserModel.self, from: JSONSerialization.data(withJSONObject: payload))

          completion(.success(self.user))

        } catch {
          print("Decoding Error \(error.localizedDescription)")
        }

      }).store(in: &cancellables)
  }

  func register(_ completion: @escaping (Result<UserModel?, Error>) -> Void?) {
    if txtPassword.isEmpty {
      showAlertTitle = "Error"
      showMessage = "Please enter username"
      showAlert = true
      return
    }

    if !txtEmail.isValidEmail {
      showAlertTitle = "Error"
      showMessage = "Please enter valid email address"
      showAlert = true
      return
    }

    if txtPassword.isEmpty {
      showAlertTitle = "Error"
      showMessage = "Please enter password"
      showAlert = true
      return
    }

    provider.requestPublisher(.register(username: txtUsername, email: txtEmail, password: txtPassword))
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { completion in
        guard case let .failure(error) = completion else { return }
        print("Login error : \(error.localizedDescription)")
      }, receiveValue: { response in
        do {
          let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any]
          guard let status = json?["status"] as? String, status != "0" else {
            let message = json?["message"] as? String
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: message!])
            self.showAlert = true
            self.showAlertTitle = "Error"
            self.showMessage = error.localizedDescription
            completion(.failure(error))
            return
          }

          guard let payload = json?["payload"] as? [String: Any] else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Oops! Something went wrong"])
            self.showAlert = true
            self.showAlertTitle = "Error"
            self.showMessage = error.localizedDescription
            completion(.failure(error))
            return
          }

          Utils.setUserDefault(data: payload, key: "user")

          self.user = try JSONDecoder().decode(UserModel.self, from: JSONSerialization.data(withJSONObject: payload))

          completion(.success(self.user))

        } catch {
          print("Decoding Error \(error.localizedDescription)")
        }

      }).store(in: &cancellables)
  }
}
