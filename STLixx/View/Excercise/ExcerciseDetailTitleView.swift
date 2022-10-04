//
//  ExcerciseDetailTitleView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

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

struct ExcerciseDetailTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ExcerciseDetailTitleView(item: MockData.sampleExcercise)
    }
}




