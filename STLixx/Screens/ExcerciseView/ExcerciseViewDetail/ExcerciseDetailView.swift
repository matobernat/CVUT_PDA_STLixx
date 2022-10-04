//
//  ExcerciseDetailView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

struct ExcerciseDetailView: View {
    @State var excercise: Excercise

    @StateObject var viewModel = ExcerciseDetailViewModel()
    
//    init(excercise: Excercise) {
//        self.excercise = excercise
//        self.viewModel = ExcerciseDetailViewModel()
//    }
    
    var body: some View {
        List{
            ExcerciseDetailTitleView(item: excercise)
            ExcerciseMaximalSeriesView(maxSeries: excercise.maxSerie)
            ExcerciseSeriesView(seriesListCollection: excercise.seriesListCollection, viewModel: viewModel, excercise: excercise)
        }
        .sheet(isPresented: $viewModel.isShowingAddNewItemView){
            ExcerciseDetailSeriesView(viewModel: viewModel)
        }
    }

}

struct ExcerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExcerciseDetailView(excercise: MockData.sampleExcercise)
    }
}



struct ExcerciseMaximalSeriesView: View {
    var maxSeries: SeriesCollection
    
    var body: some View{
        VStack(spacing:0){
            HStack{
                Text("Maximal")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .fontWeight(.heavy)
                Spacer()
            }
            
            ScrollView(.horizontal){
                HStack{
                    AddNewSerieView()
                    ForEach(maxSeries.seriesList){ serie in
                        SerieItemView(upperLabel: serie.date,
                                      content: serie.weight,
                                      bottomLabel: serie.reps)
                    }
                    Spacer()
                }
            }
            
        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
    }
}





struct ExcerciseSeriesView: View{
    
    var seriesListCollection: [SeriesCollection]
    var viewModel: ExcerciseDetailViewModel
    var excercise: Excercise
    
    var body: some View{

        VStack(spacing: 0){
            HStack{
                Text("Series")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .fontWeight(.heavy)
                Spacer()
            }
            ScrollView{
                ForEach(seriesListCollection){ seriesList in
                    ScrollView(.horizontal){
                        HStack(spacing: 1){
                            SerieItemView(upperLabel: seriesList.date,
                                          content: seriesList.day,
                                          bottomLabel: seriesList.time)
                            
                            ForEach(seriesList.seriesList){ serie in
                                    SerieItemView(upperLabel: serie.title,
                                                  content: serie.weight,
                                                  bottomLabel: serie.reps)
                                    .onTapGesture {
                                        viewModel.isShowingAddNewItemView = true
                                        viewModel.setCurrentUpdate(updatingItem: serie, updatingFromSerie: seriesList,
                                        currentExcercise: excercise)
                                        }
                                }
                            AddNewSerieView().onTapGesture {
                                print("TODO")
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}



struct AddNewSerieView: View{
    
    var body: some View{
            VStack{
                Spacer()
                Image(systemName: "plus")
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .foregroundColor(.gray)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text("add")
                    .foregroundColor(.yellow)
                    .font(.body)
                    .fontWeight(.light)
            }.frame(width: 80, height: 70)
    }
}


struct SerieItemView: View{
    
    var upperLabel: String
    var content: String
    var bottomLabel: String
    
    var body: some View{
        VStack{
            Text(upperLabel)
                .font(.body)
                .foregroundColor(.gray)
            Text(content)
                .font(.body)
                .foregroundColor(Color(.label))
            Text(bottomLabel)
                .font(.body)
                .foregroundColor(.gray)
        }.frame(width: 70, height: 70)
    }
        
}
