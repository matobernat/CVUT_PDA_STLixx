//
//  ListView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

struct ListView: View {
    
    var excercises: [Excercise]
    @StateObject var viewModel = ExcerciseListViewModel()
    
    var body: some View {
            List{
                
                ForEach(excercises){excercise  in
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
        }
    }


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView( excercises: MockData.sampleWorkout.excercisesList)
    }
}
