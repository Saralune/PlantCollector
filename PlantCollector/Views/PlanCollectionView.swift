//
//  PlanCollectionView.swift
//  PlantCollector
//
//  Created by Sara Lefort on 11/11/2024.
//

import Foundation
import SwiftUI

struct PlanCollectionView: View {
  private let isCreation = true
  @State var isShowingAddPlantScreen = false
  @State private var searchText = ""
  @State private var searchCat: Set<Category> = []
  
  @State private var newPlant: Plant = Plant(name: "", provenance: "", category: previewCategories, image: UIImage(), date: Date(), sunLevel: 0, waterFrequency: 0, temperatureMin: 0, temperatureMax: 0, isSeed: false, isCutting: false, price: 0)
  @State var myPlantCollection: [Plant] = [previewPlantImpatiens, previewPlantOrchidee, previewPlantSensitive] //à modifier avec le tableau des plantes créées
  
  var body: some View {
    NavigationStack {
      // Recherche sur les boutons des catégories
      SearchCategoryView(selection: $searchCat)
      
      // PlantView()
      if myPlantCollection.isEmpty {
        /// `myPlantCollection` est vide, on affiche donc un message.
        Text("Aucune plante ? Va vite en bouturer une 🌱")
      } else {
        List{
          ForEach(searchResults){ plant in
            NavigationLink {
              PlantDetailView(plant: plant)
            } label: {
              PlantView(plant: plant)
            }
          }
        }
        .listStyle(.plain)
        .navigationTitle("Mes plantes 🪴")
        .sheet(isPresented: $isShowingAddPlantScreen) {
          AddOrUpdatePlantView(myPlantCollection: $myPlantCollection, plant: $newPlant, isCreation: isCreation)
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
    .searchable(text: $searchText)
  }
  
  // Résultats de la recherche
  var searchResults: [Plant] {
    if searchText.isEmpty {
      if(searchCat.isEmpty){
        return myPlantCollection
      } else {
        return myPlantCollection.filter {
          $0.category.contains(searchCat)
        }
      }
    } else {
      if(searchCat.isEmpty){
        return myPlantCollection.filter {
          $0.name.contains(searchText)
        }
      } else {
        return myPlantCollection.filter {
          $0.name.contains(searchText) && $0.category.contains(searchCat)
        }
      }
    }
  }
}

#Preview {
  PlanCollectionView()
}
