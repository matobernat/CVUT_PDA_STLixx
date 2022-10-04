//
//  STLixxApp.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

@main
struct STLixxApp: App {
    @StateObject var vm = CameraViewModel()
    var body: some Scene {
        WindowGroup {
            STLixxTabView()
                .environmentObject(vm)
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
