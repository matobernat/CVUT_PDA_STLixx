//
//  ExcerciseDetailView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

struct ExcerciseDetailView: View {
    var excercise: Excercise
    
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        List{
            ExcerciseDetailTitleView(item: excercise)
            ExcerciseMaximalView(maxSeries: excercise.maxSerie)
            ExcerciseSeriesView(seriesListCollection: excercise.seriesListCollection)
        }
        
//        .navigationTitle(excercise.name)
    }
}

struct ExcerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExcerciseDetailView(excercise: MockData.sampleExcercise, isShowingDetailView: .constant(false))
    }
}





struct ExcerciseDetailTitleView: View{
    
    var item: Excercise

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
            
            Text(item.description)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.yellow)
                
        }
    }
}



struct ExcerciseMaximalView: View{
    
    var maxSeries: SeriesList
    
    var body: some View{
        VStack(spacing:0){
            HStack{
                Text("Maximal")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .fontWeight(.heavy)
                Spacer()
            }
            HStack{
                AddNewSerieView()
                ForEach(maxSeries.seriesList){ serie in
                    SerieItemView(upperLabel: serie.date,
                                  content: serie.weight,
                                  bottomLabel: serie.reps)
                }
                Spacer()
            }
        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
    }
}




struct ExcerciseSeriesView: View{
    
    var seriesListCollection: [SeriesList]
    
    var body: some View{

        VStack(spacing: 0){
            HStack{
                Text("Series")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .fontWeight(.heavy)
                Spacer()
            }
            
            ForEach(seriesListCollection){ seriesList in
                HStack{
                    SerieItemView(upperLabel: seriesList.date,
                                  content: seriesList.day,
                                  bottomLabel: seriesList.time)

                    ForEach(seriesList.seriesList){ serie in
                            SerieItemView(upperLabel: serie.title,
                                          content: serie.weight,
                                          bottomLabel: serie.reps)
                        }
                    Spacer()
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
        }.frame(width: 80, height: 70)
    }
}
