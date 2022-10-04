//
//  ContentView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

struct STLixxTabView: View {
    var body: some View {
        TabView{
            WorkoutsListView()
                .tabItem{
                    Image(systemName: "list.bullet.rectangle")
                    Text("Workouts")
                }
            ExcerciseListView()
                .tabItem{
                    Image(systemName: "e.square.fill")
                    Text("Excercises")
                }
            AccountView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Account")
                }
            
            
        }
    }
}

struct STLixxTabView_Previews: PreviewProvider {
    static var previews: some View {
        STLixxTabView()
//            .environmentObject(ViewModel())
    }
}
