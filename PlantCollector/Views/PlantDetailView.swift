//
//  PlantDetailView.swift
//  PlantCollector
//
//  Created by Sara Lefort on 16/11/2024.
//

import SwiftUI

struct PlantDetailView: View {
  @Environment(\.dismiss) var dismiss
  @State var plant: Plant
  
    var body: some View {
      Text("Hello, \(plant.name) !")
    }
}

#Preview {
  PlantDetailView(plant: previewPlantSensitive)
}
