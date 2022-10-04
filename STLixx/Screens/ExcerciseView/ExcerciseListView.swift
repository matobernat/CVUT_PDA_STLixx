//
//  ExcerciseListView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

struct ExcerciseListView: View {
    
    @StateObject var viewModel = ExcerciseListViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    
                    AddNewItemView(name: "new Excercise...")
                        .onTapGesture {
                            viewModel.isShowingAddNewItemView = true
                        }
                    
                    ForEach(MockData.Excercises){ excercise in
                        NavigationLink(destination: ExcerciseDetailView(excercise: excercise)
                        ){
                        
                            HStack{
                                Image(excercise.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
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
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("🏋🏻‍♀️Excercises")
        }
        .accentColor(Color(.label))
        .sheet(isPresented: $viewModel.isShowingAddNewItemView){
            NewExcerciseView(viewModel: viewModel)
        }
    }
}

struct ExcerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExcerciseListView()
    }
}



