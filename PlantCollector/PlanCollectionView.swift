//
//  PlanCollectionView.swift
//  PlantCollector
//
//  Created by Sara Lefort on 11/11/2024.
//

import Foundation
import SwiftUI

struct PlanCollectionView: View {
  @State var isShowingAddPlantScreen = false
  
  @State var myPlantCollection: [Plant] = [previewPlantImpatiens, previewPlantOrchidee, previewPlantSensitive]
  
  var body: some View {
    NavigationStack {
      if myPlantCollection.isEmpty {
        /// `myPlantCollection` est vide, on affiche donc un message.
        Text("Aucune plante ? Va vite en bouturer une 🌱")
      } else {
        List{
          ForEach(myPlantCollection){ plant in
            PlantView(plant: plant)
          }
        }
        .listStyle(.plain)
        .navigationTitle("Mes plantes 🪴")
        .sheet(isPresented: $isShowingAddPlantScreen) {
          AddPlantView(myPlantCollection: $myPlantCollection)
        }
        .overlay(alignment: .bottomTrailing){
          // Bouton de création
          Button {
            isShowingAddPlantScreen = true
          } label: {
            Image(systemName: "plus")
              .font(.system(size: 28, weight: .bold))
              .foregroundStyle(.white)
              .padding()
              .background(Circle())
              .shadow(color: .black.opacity(0.3), radius: 10, x: 0.0, y: 10)
          }
          .foregroundStyle(.green)
          .padding()
        }
      }
    }
  }
}

#Preview {
  PlanCollectionView()
}
