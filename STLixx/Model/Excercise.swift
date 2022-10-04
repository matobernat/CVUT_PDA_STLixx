//
//  Excercise.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import Foundation



struct Serie: Hashable, Identifiable{
    let id = UUID()
    var date : String
    var title : String
    var weight: String
    var reps: String
}

struct SeriesCollection: Hashable, Identifiable{
    let id = UUID()
    var date: String
    var day: String
    var time: String
    var seriesList: [Serie]
    
    mutating func addNewSerieItem(){
        self.seriesList.append(createSerie(title: "-", weight: "-", reps: "-"))
    }
}


struct Excercise: Hashable, Identifiable{
    let id = UUID()
    var name: String
    var imageName: String
    var description: String
    var maxSerie: SeriesCollection
    var seriesListCollection: [SeriesCollection]
    
    mutating func addNewSerieCollection(){
        seriesListCollection.append(createSeriesCollection())
    }
}


struct Workout: Hashable, Identifiable{
    let id = UUID()
    var name: String
    var description: String
    var imageName: String
    var excercisesList: [Excercise]
}


func createExcercise(name:String, imageName:String, description: String) -> Excercise{
    return Excercise(name: name,
                     imageName: imageName,
                     description: description,
                     maxSerie: createSeriesCollection(),
                     seriesListCollection: [createSeriesCollection()])
}

func createSeriesCollection() -> SeriesCollection{
//    return SeriesCollection(date: Date.now.getString,
//                            day: Date().dayInWeek,
//                            time: Date().timeString,
//                            seriesList: [
//                                createSerie(title: "", weight: "", reps: ""),
//                                createSerie(title: "", weight: "", reps: ""),
//                                createSerie(title: "", weight: "", reps: ""),
//                            ])
    return SeriesCollection(date: "02/02/22",
                            day: "monday",
                            time: "09:43",
                            seriesList: [
                                createSerie(title: "-", weight: "-", reps: "-"),
                                createSerie(title: "-", weight: "-", reps: "-"),
                                createSerie(title: "-", weight: "-", reps: "-"),
                            ])
}

func createSerie(title:String,weight:String, reps:String)-> Serie{
//    return Serie(date: Date.now.getString,
//                 title: title,
//                 weight: weight,
//                 reps: reps)
    return Serie(date: "02/02/22",
                 title: title,
                 weight: weight,
                 reps: reps)
}

struct MockData {
    
    static let sampleMaxSerie = Serie(date: "8.3.2020",title: "S1",weight: "60kg",reps: "6x")
    static let sampleSerie = Serie(date: "1.3.2020", title: "S1", weight: "50kg", reps: "6x")
    
    
    static let sampleMaxSeriesList = SeriesCollection(date: "1.3.2020",day: "Monday",time: "16:45",
                                                seriesList: [
                                                    Serie(date: "8.3.2020",title: "S1",weight: "80kg",reps: "6x"),
                                                    Serie(date: "1.3.2020",title: "S1",weight: "60kg",reps: "6x"),
                                                    Serie(date: "26.2.2020",title: "S1",weight: "50kg",reps: "8x")])

    
    static let sampleSeriesList = SeriesCollection(date: "25.3.2020",day: "Monday",time: "16:45",
                                      seriesList: [
                                        Serie(date: "1.3.2020",title: "S1",weight: "50kg",reps: "6x"),
                                        Serie(date: "1.3.2020",title: "S2",weight: "40kg",reps: "8x"),
                                        Serie(date: "1.3.2020",title: "S3",weight: "30kg",reps: "10x"),
                                        Serie(date: "1.3.2020",title: "S4",weight: "30kg",reps: "8x")
                                      ])
    
    static let benchSeriesList = SeriesCollection(date: "25.3.2020",day: "Monday",time: "17:45",
                                      seriesList: [
                                        Serie(date: "1.3.2020",title: "S1",weight: "80kg",reps: "10x"),
                                        Serie(date: "1.3.2020",title: "S2",weight: "80kg",reps: "8x"),
                                        Serie(date: "1.3.2020",title: "S3",weight: "70kg",reps: "10x"),
                                        Serie(date: "1.3.2020",title: "S2",weight: "70kg",reps: "8x")
                                      ])
    
    
    
    static let sampleExcercise = Excercise(name: "Biceps Curls",
                                            imageName: "bicepsCurl",
                                            description: "Good excerice for biceps muscles",
                                            maxSerie: sampleMaxSeriesList,
                                            seriesListCollection: [sampleSeriesList,sampleSeriesList,sampleSeriesList]
                                            
                                            
                                            
    )
    static let benchExcercise = Excercise(name: "Bench Press",
                                            imageName: "benchPress",
                                            description: "Good excerice for chest building",
                                            maxSerie: sampleMaxSeriesList,
                                            seriesListCollection: [benchSeriesList, benchSeriesList,benchSeriesList]
    )

    
    static let sampleWorkout = Workout(name: "Monday Chest Essentials",
                                       description: "Upper Chest Back Shoulder",
                                       imageName: "mondayChestEssentials",
                                       excercisesList: [sampleExcercise,benchExcercise])
    
    static let backWorkout =   Workout(name: "Tuesday Back Essentials",
                                       description: "Upper Chest Back Shoulder",
                                       imageName: "tuesdayBackEssentials",
                                       excercisesList: [sampleExcercise,benchExcercise])
    
    
    static let legWorkout =    Workout(name: "Wednesday Leg Essentials",
                                       description: "Leg & Glutes",
                                       imageName: "deadLift",
                                       excercisesList: [sampleExcercise,benchExcercise])
    
    
    
    static var Workouts = [Workout(name: "Monday Chest Essentials",
                                   description: "Upper Chest Back Shoulder",
                                   imageName: "mondayChestEssentials",
                                   excercisesList: [sampleExcercise,benchExcercise]),
                           Workout(name: "Tuesday Back Essentials",
                                   description: "Upper Chest Back Shoulder",
                                   imageName: "tuesdayBackEssentials",
                                   excercisesList: [sampleExcercise,benchExcercise]),
                           Workout(name: "Wednesday Leg Essentials",
                                   description: "Leg & Glutes",
                                   imageName: "deadLift",
                                   excercisesList: [sampleExcercise,benchExcercise]),
                           Workout(name: "Monday Chest Essentials",
                                  description: "Upper Chest Back Shoulder",
                                  imageName: "mondayChestEssentials",
                                  excercisesList: [sampleExcercise,benchExcercise]),
                          Workout(name: "Tuesday Back Essentials",
                                  description: "Upper Chest Back Shoulder",
                                  imageName: "tuesdayBackEssentials",
                                  excercisesList: [sampleExcercise,benchExcercise]),
                          Workout(name: "Wednesday Leg Essentials",
                                  description: "Leg & Glutes",
                                  imageName: "deadLift",
                                  excercisesList: [sampleExcercise,benchExcercise]),
                           Workout(name: "Monday Chest Essentials",
                                  description: "Upper Chest Back Shoulder",
                                  imageName: "mondayChestEssentials",
                                  excercisesList: [sampleExcercise,benchExcercise]),
                          Workout(name: "Tuesday Back Essentials",
                                  description: "Upper Chest Back Shoulder",
                                  imageName: "tuesdayBackEssentials",
                                  excercisesList: [sampleExcercise,benchExcercise]),
                          Workout(name: "Wednesday Leg Essentials",
                                  description: "Leg & Glutes",
                                  imageName: "deadLift",
                                  excercisesList: [sampleExcercise,benchExcercise]),]
  
    
    
    static var Excercises = [Excercise(name: "Biceps Curls",
                                       imageName: "bicepsCurl",
                                       description: "Good excerice for biceps muscles",
                                       maxSerie: sampleMaxSeriesList,
                                       seriesListCollection: [sampleSeriesList,sampleSeriesList,sampleSeriesList]),
                            Excercise(name: "Bench Press",
                                       imageName: "benchPress",
                                       description: "Good excerice for chest building",
                                       maxSerie: sampleMaxSeriesList,
                                       seriesListCollection: [benchSeriesList, benchSeriesList,benchSeriesList]),
                            Excercise(name: "Excercise",
                                       imageName: "noImage",
                                       description: " Type description....",
                                       maxSerie: sampleMaxSeriesList,
                                       seriesListCollection: [sampleSeriesList,sampleSeriesList,sampleSeriesList]),
                             Excercise(name: "Excercise",
                                        imageName: "noImage",
                                        description: " Type description....",
                                        maxSerie: sampleMaxSeriesList,
                                        seriesListCollection: [sampleSeriesList,sampleSeriesList,sampleSeriesList]),
                             Excercise(name: "Excercise",
                                        imageName: "noImage",
                                        description: " Type description....",
                                        maxSerie: sampleMaxSeriesList,
                                        seriesListCollection: [sampleSeriesList,sampleSeriesList,sampleSeriesList]),
                             Excercise(name: "Excercise",
                                        imageName: "noImage",
                                        description: " Type description....",
                                        maxSerie: sampleMaxSeriesList,
                                        seriesListCollection: [sampleSeriesList,sampleSeriesList,sampleSeriesList]),
                                      ]
    
}
