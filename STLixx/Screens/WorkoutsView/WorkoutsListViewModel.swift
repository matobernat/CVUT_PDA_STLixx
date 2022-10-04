//
//  WorkoutsListViewModel.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

final class WorkoutsListViewModel: ObservableObject {
    
    var selectedWorkout: Workout?{
        didSet{ isShowingDetailView = true }
    }
    
    @Published var isShowingDetailView = false
    @Published var isShowingAddNewItemView = false
    
}
