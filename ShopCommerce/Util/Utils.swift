//
//  Utils.swift
//  ShopCommerce
//
//  Created by Gilang Aditya Rahman on 16/02/24.
//

import Foundation

class Utils {
  class func setUserDefault(data: Any, key: String) {
    if let dataPersist = data as? [String: Any] {
      do {
        let data = try JSONSerialization.data(withJSONObject: dataPersist, options: [])
        UserDefaults.standard.set(data, forKey: key)
      } catch {
        print("Error converting JSON to Data: \(error.localizedDescription)")
      }
    }
  }

  class func getUserDefaultValue(key: String) -> Any {
    return UserDefaults.standard.value(forKey: key) as Any
  }

  class func getUserDefaultObject(key: String) -> Any {
    return UserDefaults.standard.object(forKey: key) as Any
  }

  class func getUserDefaultBool(key: String) -> Any {
    return UserDefaults.standard.value(forKey: key) as? Bool ?? false
  }

  class func getUserDefaultBoolTrue(key: String) -> Any {
    return UserDefaults.standard.value(forKey: key) as? Bool ?? true
  }

  class func removeUserDefault(key: String) {
    UserDefaults.standard.removeObject(forKey: key)
  }
}
