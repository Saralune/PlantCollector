//
//  PlantCollectorApp.swift
//  PlantCollector
//
//  Created by Sara Lefort on 11/11/2024.
//

import SwiftUI

@main
struct PlantCollectorApp: App {
  @State var myPlantCollection: [Plant] = [previewPlantImpatiens, previewPlantOrchidee, previewPlantSensitive]
  
  var body: some Scene {
    WindowGroup {
      PlanCollectionView(myPlantCollection: myPlantCollection)
    }
  }
}
