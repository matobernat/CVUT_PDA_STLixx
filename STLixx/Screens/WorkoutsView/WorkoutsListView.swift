//
//  WorkoutsListView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

struct WorkoutsListView: View {
    
    @StateObject var viewModel = WorkoutsListViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    
//                    NavigationLink(destination: NewWorkoutView(isShowingAddnewItem:$viewModel.isShowingAddNewItemView)) {
//                        AddNewItemView(name: "new Workout...")
//                    }
                    AddNewItemView(name: "new Workout...").onTapGesture {
                        viewModel.isShowingAddNewItemView = true
                    }
                    
                    ForEach(MockData.Workouts){ workout in
                        NavigationLink(destination: WorkoutDetailView(workout: workout, isShowingDetailView: $viewModel.isShowingDetailView)
                        ){
                        
                            HStack{
                                Image(workout.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .cornerRadius(6)
                                
                                Text(workout.name)
                                    .font(.body)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.6)
                                    .padding()
                                    
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("⛓ Workouts")
        }
//        .accentColor(Color(.label))
        .sheet(isPresented: $viewModel.isShowingAddNewItemView){
            NewWorkoutView(isShowingAddnewItem: $viewModel.isShowingAddNewItemView)
        }
            
    }
}

struct WorkoutsListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsListView()
            .preferredColorScheme(.dark)
    }
}


