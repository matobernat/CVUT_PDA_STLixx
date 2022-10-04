//
//  NewWorkoutView.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import SwiftUI


struct NewWorkoutView: View {
    
    @Binding var isShowingAddnewItem: Bool
    @StateObject var viewModel = NewWorkoutViewModel()
    @EnvironmentObject var vm: CameraViewModel
    
    var body: some View {
        VStack(spacing: 5){
                
                HStack{
                    Button{
                        viewModel.exitAddingWorkout(added: false)
                        isShowingAddnewItem = false
                    }label:{
                        Text("Exit")
                    }
                    Spacer()
                    Button{
                        viewModel.exitAddingWorkout(added: true)
                        isShowingAddnewItem = false
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
                        TextField("Excercise Name", text: $viewModel.workout.name)
                        TextField("Description", text: $viewModel.workout.description)
                    }
                    Button { viewModel.isShowingAddExcercises = true }label:{
                    HStack{
                        Image(systemName: "plus.circle")
                            .foregroundColor(.green)
                        Text("Add Excercises")
                            .foregroundColor(.yellow)
                        }
                    }
                }
                .frame(height: 210)
                
                List{
                    ForEach(Array(viewModel.addedExcercises)){excercise  in
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
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.yellow)
                                        .imageScale(.large)
                                        .frame(width: 44, height: 44)
                                }
                            }
                    }
                }

            
                
                
            }
            .sheet(isPresented: $viewModel.isShowingAddExcercises){
                AddExcercisesView(viewModel: viewModel)
            }
        }
}

struct NewWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutView(isShowingAddnewItem: .constant(false))
            .preferredColorScheme(.dark)
    }
}






//                    NavigationLink(destination: AddExcercisesView(isShowingAddExcercises:$viewModel.isShowingAddExcercises,
//                      viewModel: viewModel)) {
//                        Button { print("show Excercises") }label:{
//                            HStack{
//                                Image(systemName: "plus.circle")
//                                    .foregroundColor(.green)
//                                Text("Add Excercises")
//                                    .foregroundColor(.yellow)
//                            }
//                        }
//                    }



//    .alert("Error", isPresented: $vm.showCameraAlert, presenting: vm.cameraError, actions: { cameraError in
//        cameraError.button
//    }, message: { cameraError in
//        Text(cameraError.message)
//    })
