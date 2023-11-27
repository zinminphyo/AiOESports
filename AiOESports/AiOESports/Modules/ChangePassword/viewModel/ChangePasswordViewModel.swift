//
//  ChangePasswordViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation
import Combine

class ChangePasswordViewModel {
    
    private let service = ChangePasswordService()
    
    @Published
    var isUpdating: Bool = false
    
    @Published
    var isNewPasswordMatched: Bool = false
    
    @Published
    var isDataCompleted: Bool = false
    
    var passwordUpdateStatus = PassthroughSubject<PasswordUpdateStatus, Never>()
    enum PasswordUpdateStatus {
        case success
        case fail(error: String)
    }
    
    
    private var currentPassword: String = ""
    private var newPassword: String = ""
    private var reEnterNewPassword: String = ""
    
    func changePassword() {
        isUpdating = true
        Task {
            do {
                let response = try await service.changePassword(currentPassword: currentPassword, newPassword: newPassword)
                response ? passwordUpdateStatus.send(.success) : passwordUpdateStatus.send(.fail(error: "Your password is wrong."))
                
            } catch {
                print("Error is \(error.localizedDescription)")
            }
            isUpdating = false
        }
    }
    
    func set(newPassword: String) {
        self.newPassword = newPassword
        checkBothPaswordIsSame()
        checkDataIsCompleted()
    }
    
    func set(reEnterNewPassword: String) {
        self.reEnterNewPassword = reEnterNewPassword
        checkBothPaswordIsSame()
        checkDataIsCompleted()
    }
    
    func set(currentPassword: String) {
        self.currentPassword = currentPassword
        checkDataIsCompleted()
    }
    
    private func checkDataIsCompleted() {
        isDataCompleted = !currentPassword.isEmpty && isNewPasswordMatched
    }
    
    private func checkBothPaswordIsSame() {
        isNewPasswordMatched = newPassword == reEnterNewPassword
    }

}
