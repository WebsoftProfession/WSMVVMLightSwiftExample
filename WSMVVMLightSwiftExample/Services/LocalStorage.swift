//
//  LocalStorage.swift
//  WSMVVMLightSwiftExample
//
//  Created by WebsoftProfession on 08/08/23.
//

import Foundation
import MVVMLightSwift

class LocalStorage: BaseService {
    
    private let userDefaults = UserDefaults.standard
    
    func getValue(forKey: String) -> Any? {
        return userDefaults.value(forKey: forKey)
    }
    
    func saveValue(key: String, value: Any) {
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
    
    func getValue<T:Codable>(forKey: String, type: T.Type) -> T? {
        if let usersJson = userDefaults.value(forKey: forKey) as? String {
            let jsonObjectData = usersJson.data(using: .utf8)!
            if let users = try? JSONDecoder().decode(type, from: jsonObjectData) {
                return users
            }
        }
        return nil
    }
    
    func saveValue<T:Codable>(key: String, value: T, type: T.Type) {
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(value) {
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            userDefaults.set(json, forKey: key)
        }
        userDefaults.synchronize()
    }
    
    func removeValue(key: String) {
        userDefaults.set(nil, forKey: key)
        userDefaults.synchronize()
    }
    
}
