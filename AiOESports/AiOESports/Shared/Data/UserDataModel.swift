//
//  UserDataModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 25/11/2023.
//

import Foundation


class UserDataModel {
    
    private init() {}
    
    static let shared = UserDataModel()
    
    func saveToken(token: String?) {
        UserDefaults.standard.setValue(token, forKey: "token")
    }
    
    func getToken() -> String? {
        UserDefaults.standard.string(forKey: "token")
    }
    
}
