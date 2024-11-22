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
  @State private var searchText = ""
  @State private var searchCat: [Category] = previewCatArray
  
  @State var myPlantCollection: [Plant] = [previewPlantImpatiens, previewPlantOrchidee, previewPlantSensitive]
  
  var body: some View {
    NavigationStack {
      HStack{
        
        // Recherche sur les boutons des catégories
        ForEach(previewCatArray){ cat in
          Button(action: {
            if(searchCat.contains(cat)){
              searchCat.remove(at: searchCat.firstIndex(of: cat) ?? -1)
            } else {
              searchCat.append(cat)
            }
          }) {
            Text(cat.name).tag(cat)
              .padding(7)
            //              .background(isBtnSelected ? cat.color.opacity(0.3) : cat.color.opacity(0.8))
              .background( cat.color.opacity(0.8))
              .clipShape(RoundedRectangle(cornerRadius: 8))
              .bold()
              .foregroundStyle(.white)
          }
          //          .buttonStyle(PlainButtonStyle())
          .buttonStyle(.plain)
          //          .buttonStyle(PressedButtonCategoryStyle(cat: cat))
        }
      }
      
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
    .searchable(text: $searchText)
  }
  
  // Résultats de la recherche
  var searchResults: [Plant] {
    if searchText.isEmpty {
      return myPlantCollection
    } else {
      return myPlantCollection.filter {
        $0.name.contains(searchText)
      }
    }
  }
  
//  var searchCategoryResults: [Plant] {
//    if searchCat.isEmpty {
//      return myPlantCollection
//    } else {
//      return myPlantCollection.filter { $0.category.contains(where: { previewCatArray.contains($0) }) // à modifier en catégorie et boucler sur searchCat
//        //        $0.category.contains(searchCat)
//      }
//    }
//  }
}

#Preview {
  PlanCollectionView()
}
