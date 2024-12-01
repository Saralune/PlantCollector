//
//  AddPlantView.swift
//  PlantCollector
//
//  Created by Sara Lefort on 11/11/2024.
//

import SwiftUI
import PhotosUI

struct AddOrUpdatePlantView: View {
  @Environment(\.dismiss) var dismiss
  
  @Binding var myPlantCollection: [Plant]
  @State var pickedPhoto:  PhotosPickerItem? = nil
  @State var selectedImage = UIImage()
  @Binding var plant: Plant
  var isCreation: Bool
    
  var body: some View {
    ScrollView{
      VStack {
        //Image choisie
        PhotosPicker(selection: $pickedPhoto, matching: .images){
          if(pickedPhoto == nil){
            RoundedRectangle(cornerRadius: 10)
              .foregroundStyle(.gray)
              .overlay(alignment: .center){
                Image(systemName: "photo")
              }
              .frame(height: 300)
          } else {
            Image(uiImage: selectedImage)
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 200, height: 200)
              .clipShape(RoundedRectangle(cornerRadius: 10))
              .padding(3)
          }
        }
        .onChange(of: pickedPhoto) {
          Task {
            if let data = try? await pickedPhoto?
              .loadTransferable(type: Data.self){
              selectedImage = UIImage(data: data)!
              self.plant.image = selectedImage
            }
          }
        }
        
        // Nom
        TextField("Nom", text: $plant.name)
          .textFieldStyle(.roundedBorder)
        
        // Provenance
        TextField("Provenance", text: $plant.provenance)
          .textFieldStyle(.roundedBorder)
        
        // Date
        DatePicker("Date", selection: $plant.date, displayedComponents: .date)
        
        // Ensoleillement
        HStack{
          Text("Ensoleillement")
          Spacer()
          RatingView(rating: $plant.sunLevel, ratingImageName: "sun.max")
        }
        .padding([.bottom, .top], 10)
        
        // Arrosage
        HStack{
          Text("Arrosage")
          Spacer()
          RatingView(rating: $plant.waterFrequency, ratingImageName: "drop")
        }
        .padding(.bottom, 10)
        
        // Température Max
        HStack{
          Text("Température")
          Spacer()
          Text("min")
          TextField("", value: $plant.temperatureMin, format: .number)
            .textFieldStyle(.roundedBorder)
            .frame(width: 50)
            .keyboardType(.numberPad)

          Text("max")
          TextField("", value: $plant.temperatureMax, format: .number)
            .textFieldStyle(.roundedBorder)
            .frame(width: 50)
            .keyboardType(.numberPad)

        }
        .frame(minWidth: 0, alignment: .leading)
        
        // Semis ?
        HStack{
          Toggle(isOn: $plant.isSeed,
                 label: {
            Text("Semis")
          })
        }
        
        // Bouture ?
        Toggle(isOn: $plant.isCutting,
               label: {
          Text("Bouture")
        })
        
        // Prix
        HStack(spacing: 20){
          Text("Prix")
          TextField("", value: $plant.price, format: .number)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
          Stepper("test", value: $plant.price)
            .labelsHidden()
        }
        
        // Catégorie
        VStack{
          Text("Catégories")
          HStack{
            SearchCategoryView(selection: $plant.category)
          }
        }
        
        // Bouton de sauvegarde
        Button {
          savePlant()
        } label: {
          Text(isCreation ? "Créer" : "Modifier")
            .padding()
            .foregroundStyle(.white)
            .bold()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding()
      }
      .padding()
    }
  }

  private func savePlant() {
    if(isCreation) {
      myPlantCollection.append(plant)
    } 
    dismiss() // Quitter l'écran automatiquement
  }
}


#Preview {
  AddOrUpdatePlantView(myPlantCollection: .constant([]), plant: .constant(previewPlantOrchidee), isCreation: true)
}

