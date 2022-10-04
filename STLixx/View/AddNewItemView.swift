//
//  AddNewItemView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI

struct AddNewItemView: View {
        var name: String
    var body: some View {
            HStack{
                ZStack{
                    Rectangle()
                        .fill(.black)
                        .frame(width: 100, height: 100)
                        .cornerRadius(6)
                    Image(systemName: "plus")
                        .symbolRenderingMode(.monochrome)
                        .resizable()
                        .foregroundColor(.yellow)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                }
                Text(name)
                    .font(.body)
                    .foregroundColor(.yellow)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                    .padding()

            }

    }
}

struct AddNewItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewItemView( name: "new Item....")
    }
}
