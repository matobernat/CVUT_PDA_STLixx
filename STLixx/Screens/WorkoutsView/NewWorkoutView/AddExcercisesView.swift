//
//  AddExcercisesView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

struct AddExcercisesView: View {
    
    @StateObject var viewModel: NewWorkoutViewModel
    
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    viewModel.exitAddingExcercises(added: false)
                }label:{
                    Text("Exit")
                }
                Spacer()
                Button{
                    viewModel.exitAddingExcercises(added: true)
                }label:{
                    Text("Done")
                        .fontWeight(.semibold)
                }
            }.padding(10)
            List{
                ForEach(viewModel.excercises){excercise  in
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
                            Spacer()
                            Button{
                                viewModel.addExcercise(excercise: excercise)
        
                            }label:{
                                Image(systemName: viewModel.addedExcercises.contains(excercise) ? "checkmark":"plus.circle")
                                    .foregroundColor(.yellow)
                                    .imageScale(.large)
                                    .frame(width: 44, height: 44)
                            }
                        }
                }
            }
        }
    }
}




struct AddExcercisesView_Previews: PreviewProvider {
    static var previews: some View {
        AddExcercisesView(viewModel: NewWorkoutViewModel())
            .preferredColorScheme(.dark)
    }
}






