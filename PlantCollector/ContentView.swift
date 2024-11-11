//
//  ContentView.swift
//  PlantCollector
//
//  Created by Sara Lefort on 11/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          PlantView(plant: previewPlantImpatiens)
          PlantView(plant: previewPlantOrchidee)
          PlantView(plant: previewPlantSensitive)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
