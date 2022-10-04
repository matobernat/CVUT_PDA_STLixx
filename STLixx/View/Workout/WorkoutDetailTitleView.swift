//
//  WorkoutDetailTitleView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

struct WorkoutDetailTitleView: View {
    
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

struct WorkoutDetailTitleView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailTitleView(item: MockData.sampleWorkout)
    }
}

