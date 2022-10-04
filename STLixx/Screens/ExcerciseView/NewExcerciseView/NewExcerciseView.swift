//
//  NewExcerciseView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 15/05/2022.
//

import SwiftUI



struct NewExcerciseView: View {
    
    @StateObject var viewModel: ExcerciseListViewModel
    @EnvironmentObject var vm: CameraViewModel
    
    var body: some View {
        VStack{
                HStack{
                    Button{
                        viewModel.exitAddingExcercise(added: false)
                    }label:{
                        Text("Exit")
                    }
                    Spacer()
                    Button{
                        viewModel.exitAddingExcercise(added: true)
                    }label:{
                        Text("Done")
                            .fontWeight(.semibold)
                    }
                }.padding(10)
            
            Button{
                print("set photo")
                vm.source = .camera
                vm.showPhotoPicker()
            
            }label:{
                ZStack{
                    Image("noImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(6)
                    Image(systemName: "camera.circle.fill")
                        .foregroundColor(.yellow)
                        .imageScale(.large)
                        .frame(width: 80, height: 80)
                }
            }
            .alert("Error", isPresented: $vm.showCameraAlert, presenting: vm.cameraError, actions: { cameraError in
                cameraError.button
            }, message: { cameraError in
                Text(cameraError.message)
            })
                
                Form{
                    Section{
                        TextField("Excercise Name", text: $viewModel.newExcercise.name)
                        TextField("Description", text: $viewModel.newExcercise.description)
                    }
                }
                Spacer()
                
            }
        }
}

struct NewExcerciseView_Previews: PreviewProvider {
    static var previews: some View {
        NewExcerciseView(viewModel: ExcerciseListViewModel())
    }
}
