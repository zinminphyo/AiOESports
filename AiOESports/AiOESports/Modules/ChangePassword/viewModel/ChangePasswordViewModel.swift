//
//  ChangePasswordViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation


class ChangePasswordViewModel {
    
    private let service = ChangePasswordService()
    
    @Published
    var isUpdating: Bool = false
    
    @Published
    var isNewPasswordMatched: Bool = false
    
    @Published
    var isDataCompleted: Bool = false
    
    private var currentPassword: String = ""
    private var newPassword: String = ""
    private var reEnterNewPassword: String = ""
    
    func changePassword() {
        isUpdating = true
        Task {
            do {
                let response = try await service.changePassword(currentPassword: currentPassword, newPassword: newPassword)
                print("Response is \(response)")
            } catch {
                print("Error is \(error.localizedDescription)")
            }
            isUpdating = false
        }
    }
    
    func set(newPassword: String) {
        self.newPassword = newPassword
        isNewPasswordMatched = self.newPassword == self.reEnterNewPassword
    }
    
    func set(reEnterNewPassword: String) {
        self.reEnterNewPassword = reEnterNewPassword
        isNewPasswordMatched = self.newPassword == self.reEnterNewPassword
    }

}
