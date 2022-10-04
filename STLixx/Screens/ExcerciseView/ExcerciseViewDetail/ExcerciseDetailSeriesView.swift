//
//  ExcerciseDetailSeriesView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 15/05/2022.
//

import SwiftUI

struct ExcerciseDetailSeriesView: View {
    
    @StateObject var viewModel : ExcerciseDetailViewModel
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    viewModel.exitUpdatingSerie(added: false)
                }label:{
                    Text("Exit")
                }
                Spacer()
                Button{
                    viewModel.exitUpdatingSerie(added: true)
                }label:{
                    Text("Done")
                        .fontWeight(.semibold)
                }
            }.padding(10)
            Form{
                Section(header: Text("Update Series")){
                    TextField("Serie Title", text: $viewModel.pseudoSerie.formTitle)
                    TextField("Weigt", text: $viewModel.pseudoSerie.formWeight)
                    TextField("Reps", text: $viewModel.pseudoSerie.formReps)
        
                }
            }
        }
    }
}


struct ExcerciseDetailSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        ExcerciseDetailSeriesView(viewModel: ExcerciseDetailViewModel())
    }
}
