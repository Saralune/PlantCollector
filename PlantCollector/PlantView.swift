//
//  PlantView.swift
//  PlantCollector
//
//  Created by Sara Lefort on 11/11/2024.
//

import SwiftUI

struct PlantView: View {
  @State var category: Category
  @State var plant: Plant
  
  var body: some View {
    HStack (alignment: .center){
      Image(plant.image)
        .resizable()
        .frame(width: 100, height: 150)
        .scaledToFill() // utile ?
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .clipped() // utile ?
      
      VStack(alignment: .leading, spacing: 10) {
        Text(plant.name)
          .font(.title)
          .bold()
        
        Text(plant.date.formatted(date: .numeric, time:.omitted) + " - " + plant.provenance)
          .font(.caption)
          .fontWeight(.light)
        
        Text("Category")
          .padding(7)
          .background(category.color.opacity(0.6))
          .clipShape(RoundedRectangle(cornerRadius: 10))
          .foregroundColor(.white)
          .bold()
          .padding(.top, 20)
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(10)
  }
}

#Preview {
  PlantView(category: previewCatInt, plant: previewPlantImpatiens)
}
