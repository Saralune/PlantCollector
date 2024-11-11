//
//  PlanCollectionView.swift
//  PlantCollector
//
//  Created by Sara Lefort on 11/11/2024.
//

import Foundation
import SwiftUI

struct PlanCollectionView: View {
  @State var myPlantCollection: [Plant] = [previewPlantImpatiens, previewPlantOrchidee, previewPlantSensitive]
  
    var body: some View {
      NavigationStack {
        VStack {
          List{
            ForEach(myPlantCollection){ plant in
              PlantView(plant: plant)
            }
          }
        }
        .listStyle(.plain)
        .navigationTitle("Mes plantes 🪴")
      }
    }
}

#Preview {
  PlanCollectionView()
}
