//
//  ExcerciseListViewModel.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

final class ExcerciseListViewModel: ObservableObject {
    
    @Published var excercises = MockData.Excercises
    @Published var isShowingDetailView = false
    @Published var isShowingAddNewItemView = false
    @Published var  newExcercise = PseudoExcercise(name: "", imageName: "noImage", description: "")
    
    
    func exitAddingExcercise(added: Bool){
        if (added){
            MockData.Excercises.append(createExcercise(name: newExcercise.name,
                                              imageName: newExcercise.imageName,
                                              description: newExcercise.description))
        }
        isShowingAddNewItemView = false
    }
    
    
}


struct PseudoExcercise{
    var name: String
    var imageName: String
    var description: String
}
