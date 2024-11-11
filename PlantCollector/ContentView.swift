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
          PlantView(category: previewCatInt, plant: previewPlantImpatiens)
          PlantView(category: previewCatExt, plant: previewPlantOrchidee)
          PlantView(category: previewCatSemis, plant: previewPlantSensitive)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
