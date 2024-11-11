//
//  ContentView.swift
//  PlantCollector
//
//  Created by Sara Lefort on 11/11/2024.
//

import SwiftUI

struct ContentView: View {
  @State var myPlantCollection: [Plant] = [previewPlantImpatiens, previewPlantOrchidee, previewPlantSensitive]
  
    var body: some View {
      PlanCollectionView(myPlantCollection: myPlantCollection)
    }
}

#Preview {
    ContentView()
}
