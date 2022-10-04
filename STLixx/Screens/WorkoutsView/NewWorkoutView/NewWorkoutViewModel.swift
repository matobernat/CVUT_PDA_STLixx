//
//  AccountViewModel.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import Foundation
import SwiftUI



import Foundation
import SwiftUI


final class NewWorkoutViewModel: ObservableObject{
    
//    @AppStorage("user") private var userData: Data?
    @Published var workout = Workout(name: "", description: "", imageName: "noImage", excercisesList: [])
    @Published var alertItem: AlertItem?
    @Published var isShowingAddExcercises = false
    @Published var excercises = MockData.Excercises
    @Published var addedExcercises = Set<Excercise>()
    
    
    
    
    func saveChanges(){
       
    }
    
    func addExcercise(excercise: Excercise){
        addedExcercises.insert(excercise)
    }
    
    
    func exitAddingExcercises(added: Bool){
        if  !added{
            addedExcercises.removeAll()
        }
        isShowingAddExcercises = false
                
    }
    
    func exitAddingWorkout(added: Bool){
        if  added{
            workout.excercisesList = Array(addedExcercises)
            if (workout.name == ""){
                workout.name = "Untitled Workout"
            }
            MockData.Workouts.append(workout)
        }
        
                
    }
}
