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
  @State var isShowingUpdateScreen = false
  
  var body: some View {
    NavigationStack {
      VStack{
        
        // Catégorie
        HStack{
          ForEach(Array(plant.category)) { category in
            Text(category.name)
              .padding(7)
              .background(category.color.opacity(0.6))
              .clipShape(RoundedRectangle(cornerRadius: 10))
              .foregroundColor(.white)
              .bold()
          }
        }
        .padding()
        
        HStack{
          Image(uiImage: plant.image)
            .resizable()
            .frame(width: 200, height: 200)
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.leading)
          
          VStack{
            if(plant.price > 0) {
              Text("\(plant.price, specifier: "%.2f") €")
                .font(.headline)
                .foregroundStyle(.gray)
            }
            
            Text(plant.date.formatted(date: .numeric, time: .omitted))
              .multilineTextAlignment(.center)
              .padding()
              .bold()
            
            Divider()
              .padding([.trailing, .leading])
            
            // Ensoleillement & arrosage
            RatingView(rating: .constant(plant.sunLevel), ratingImageName: "sun.max") // TODO : vérifier si ok quand page de modification créée
              .padding(5)
            
            RatingView(rating: .constant(plant.waterFrequency), ratingImageName: "drop") // TODO : vérifier si ok quand page de modification créée
              .padding(5)
          }
        }
        
        Divider()
          .padding()
        
        
        // Températures
        Text("Température conseillée : \(plant.temperatureMin) - \(plant.temperatureMax)°C")
        
        // Provenance
        ZStack(alignment: .leading) {
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color(red: 0.149, green: 0.569, blue: 0.514).opacity(0.4), lineWidth: 2)
            .fill(Color(red: 0.831, green: 0.914, blue: 0.902).opacity(0.3))
          
          Text(plant.provenance)
          
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(10)
        }
        .padding()
        .fixedSize(horizontal: false, vertical: true)
        
        // Prix
        
        
        // Graine ou Bouture ?
        HStack{
          Image(systemName: plant.isSeed ? "checkmark.square.fill" : "square")
            .foregroundStyle(Color(red: 0.149, green: 0.569, blue: 0.514))
          Text("Semis")
          
          Image(systemName: plant.isCutting ? "checkmark.square.fill" : "square")
            .foregroundStyle(Color(red: 0.149, green: 0.569, blue: 0.514))
          Text("Bouture")
        }
        
        // Galerie de photos enregistrées
        
      }
      .navigationTitle(plant.name)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
      .navigationBarBackButtonHidden(false)
      .toolbar{
        ToolbarItem(placement: .topBarTrailing) {
                Button("Modifier") {
                  isShowingUpdateScreen = true
                }
            }
      }
      .sheet(isPresented: $isShowingUpdateScreen){
        UpdatePlantview()
      }
    } //NavigationStack
    
    
  }
}

#Preview {
  PlantDetailView(plant: previewPlantImpatiens)
}
