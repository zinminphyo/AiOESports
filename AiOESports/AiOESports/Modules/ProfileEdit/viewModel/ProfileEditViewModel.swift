//
//  ProfileEditViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 26/11/2023.
//

import Foundation
import Combine
import UIKit


class ProfileEditViewModel {
    
    struct Region: Decodable {
        let id: Int
        let nameEN: String
        let nameMM: String
        let code: String
    }
    
    struct City: Decodable {
        let id: Int
        let regionId: Int
        let nameEN: String
        let nameMM: String
        let code: String
        let created_at: String
        let updated_at: String
    }
    
    let id: Int
    
    var editInfo: ProfileEdit
    
    var updateInfo = [String:Any]()
    
    var userInfoFetchingCompleted = PassthroughSubject<UserInfo, Never>()
    
    
    @Published
    var currentStateName: String = ""
    
    @Published
    var currentCityName: String = ""
    
    @Published
    private(set) var regions: [Region] = []
    @Published
    private(set) var cities: [City] = []
    
    @Published
    var isUpdating: Bool = false
    var profileEditCompleted = PassthroughSubject<Void, Never>()
    
    init(info: ProfileInfoViewModel.ProfileInfo) {
        id = info.id
        editInfo = ProfileEdit(info: info)
    }
    
    func fetchProfile() {
        isUpdating = true
        let service = UserInfoFetchingService()
        Task {
            do {
                let response = try await service.fetchUserInfo()
                userInfoFetchingCompleted.send(response)
            } catch {
                print("Error is \(error.localizedDescription)")
            }
            isUpdating = false
        }
    }
    
    func updateProfile() {
        isUpdating = true
        let updateService = ProfileUpdateService(id: id)
        Task {
            do {
                let response = try await updateService.update(updateInfo: updateInfo)
                print("Update response is \(response)")
                profileEditCompleted.send()
            } catch {
                print("Error in update profile service is \(error.localizedDescription)")
            }
            isUpdating = false
        }
    }
    
    
    
    func fetchStateLists() {
        guard let url = Bundle.main.url(forResource: "regions", withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else { return }
        let decoder = JSONDecoder()
        guard let regs = try? decoder.decode([Region].self, from: data) else { return }
        regions = regs
        if !regions.isEmpty { setRegion(region: regions[0]) }
    }
    
    private func fetchCityLists(regionId: Int) {
        guard let url = Bundle.main.url(forResource: "cities", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return
        }
        let decoder = JSONDecoder()
        guard let cities = try? decoder.decode([City].self, from: data) else {
            return
        }
        self.cities = cities.filter{ $0.regionId == regionId }
        if !self.cities.isEmpty { setCity(city: self.cities[0]) }
    }
    
    
    func setRegion(region: Region) {
        currentStateName = region.nameEN
        fetchCityLists(regionId: region.id)
    }
    
    func setCity(city: City) {
        currentCityName = city.nameEN
    }
    
}

extension ProfileEditViewModel {
    func set(facebookLink: String) {
        updateInfo["facebook_link"] = facebookLink
    }
    
    func set(instagramLink: String) {
        updateInfo["instagram_link"] = instagramLink
    }
    
    func set(username: String) {
        updateInfo["username"] = username
    }
    
    func set(phoneNumber: String) {
        
    }
    
    func set(image: UIImage) {
        updateInfo["profile_image"] = image
    }
    
    
    func set(dob: String) {
        updateInfo["date-of-birth"] = dob
    }
    
    func set(state: String) {
        guard let index = regions.firstIndex(where: { $0.nameEN == state }) else { return }
        setRegion(region: regions[index])
        updateInfo["state"] = state
    }
    
    func set(city: String) {
        guard let index = cities.firstIndex(where: { $0.nameEN == city } ) else { return }
        setCity(city: cities[index])
        updateInfo["city"] = city
    }
    
    func set(gender: String) {
        updateInfo["gender"] = gender
    }
    
}


extension ProfileEditViewModel {
    struct ProfileEdit {
        var profileURL: String = ""
        var username: String = ""
        var phoneNumber: String = ""
        var gender: String = ""
        var dateOfBirth: String = ""
        var city: String = ""
        var state: String = ""
        var level: String = ""
        var facebook: String? = nil
        var instagram: String? = nil
        
        init(info: ProfileInfoViewModel.ProfileInfo) {
            profileURL = info.profileURL
            username = info.username
            phoneNumber = info.phoneNumber
            gender = info.gender
            dateOfBirth = info.dateOfBirth
            level = info.level
            city = info.city
            state = info.state
            facebook = info.facebook
            instagram = info.instagram
        }
    }
}
