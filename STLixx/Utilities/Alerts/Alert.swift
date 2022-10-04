//
//  Alert.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

struct AlertItem:Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext{
    //MARK: - Device Alerts
    static let invalidCamera = AlertItem(title: Text("Invalid Camera"),
                                        message: Text("The camera on this device is not working."),
                                        dismissButton: .default(Text("OK")))
    
    //MARK: - Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data recieved from the server was invalid. Please contact support."),
                                       dismissButton: .default(Text("OK")))
    
    
    //MARK: -Account Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                       message: Text("Please ensure all fields in the form have been filled out."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                       message: Text("Please ensure your email is correct."),
                                       dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),
                                       message: Text("Your profile informations were successfully saved."),
                                       dismissButton: .default(Text("OK")))
    
    static let ivalidUserData = AlertItem(title: Text("Profile Error"),
                                       message: Text("There was an error saving or retrieving your profile."),
                                       dismissButton: .default(Text("OK")))
}
