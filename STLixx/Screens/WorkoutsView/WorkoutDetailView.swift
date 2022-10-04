//
//  WorkoutDetailView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

struct WorkoutDetailView: View {
    
    var workout: Workout
    
    @Binding var isShowingDetailView: Bool
    @StateObject var viewModel = ExcerciseListViewModel()
    
    var body: some View {

        List{
            
            DetailViewTitle(item: workout)
            
            ForEach(workout.excercisesList){
                excercise  in
                NavigationLink(destination: ExcerciseDetailView(excercise: excercise,
                                                                isShowingDetailView: $viewModel.isShowingDetailView)
                ){
                    HStack{
                        Image(excercise.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipped()
                            .cornerRadius(6)
                        
                        Text(excercise.name)
                            .font(.body)
                            .scaledToFit()
                            .minimumScaleFactor(0.6)
                            .padding()
                            
                    }
                }
            }
        }
//        .navigationTitle(workout.name)
    }
}





struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView(workout: MockData.sampleWorkout, isShowingDetailView: .constant(false) )
            .preferredColorScheme(.dark)
    }
}









struct DetailViewTitle: View{
    
    var item: Workout

    var body: some View{
        VStack{
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 300)
                .clipped()
                .cornerRadius(6)
            
            Text(item.name)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(5)
            
            Text(item.description)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.yellow)
                
        }
    }
}
