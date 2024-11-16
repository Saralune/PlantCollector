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
    NavigationStack {
      VStack{
        
        // Catégorie
        HStack{
          ForEach(plant.category) { category in
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
          
          
          VStack{
            Text(plant.date.formatted(date: .complete, time: .omitted))
//              .environment(\.locale, .init(identifier: "fr_FR"))
              .multilineTextAlignment(.center)
              .padding()
            
            Divider()
              .padding([.trailing, .leading])
            
            // Ensoleillement & arrosage
            RatingView(rating: plant.sunLevel, ratingImageName: "sun.max")
              .padding(5)
            
            RatingView(rating: plant.waterFrequency, ratingImageName: "drop")
              .padding(5)
          }
        }
        
        Divider()
          .padding()
        
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
        
        //
          
      }
      .navigationTitle(plant.name)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
      
    }
  }
}

#Preview {
  PlantDetailView(plant: previewPlantImpatiens)
}
