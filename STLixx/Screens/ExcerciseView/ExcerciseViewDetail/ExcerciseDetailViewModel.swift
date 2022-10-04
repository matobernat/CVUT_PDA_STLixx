//
//  ExcerciseDetailViewModel.swift
//  STLixx
//
//  Created by Nicolas Neznik on 15/05/2022.
//

import Foundation
import SwiftUI

final class ExcerciseDetailViewModel: ObservableObject {
    
    @Published var isShowingAddNewItemView = false
    @Published var isShowingDetailView = false
    @Published var currentExcercise = MockData.sampleExcercise
    @Published var updatingFromSerie = MockData.sampleSeriesList
    @Published var updatingItem = MockData.sampleSerie
    
    @Published var pseudoSerie = PseudoSerie(formTitle: "", formWeight: "", formReps: "")
    


    
    
    func setCurrentUpdate(updatingItem: Serie, updatingFromSerie: SeriesCollection, currentExcercise: Excercise){
        self.updatingItem = updatingItem
        self.updatingFromSerie = updatingFromSerie
        self.currentExcercise = currentExcercise
    }

    
    func exitUpdatingSerie(added: Bool){
        if (added) {
            updatingItem.title = pseudoSerie.formTitle
            updatingItem.weight = pseudoSerie.formWeight
            updatingItem.reps = pseudoSerie.formReps
        }
        pseudoSerie = PseudoSerie(formTitle: "", formWeight: "", formReps: "")
        isShowingAddNewItemView = false
    }
    
    
    
    struct PseudoSerie{
        var formTitle = ""
        var formWeight = ""
        var formReps = ""
    }
    
    
//    var selectedExcercise: Excercise?{
//        didSet{ isShowingDetailView = true }
//    }
//
//    @Published var isShowingDetailView = false
//    @Published var isShowingAddNewItemView = false
    
}
