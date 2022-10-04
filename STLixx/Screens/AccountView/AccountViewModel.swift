//
//  AccountViewModel.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import Foundation
import SwiftUI


final class AccountViewModel: ObservableObject{
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges(){
        guard isValidForm else{ return }
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }catch{
            alertItem = AlertContext.ivalidUserData
        }
        
    }
    
    func retrieveUser(){
        guard let userDate = userData else{ return }
        
        do{
            user = try JSONDecoder().decode(User.self, from: userDate)
        }catch{
            alertItem = AlertContext.ivalidUserData
        }
        
    }
    
    
    var isValidForm: Bool {
        guard !user.nickname.isEmpty && !user.email.isEmpty else{
            alertItem = AlertContext.invalidForm
            return false
        }
        guard user.email.isValidEmail else{
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
}
















