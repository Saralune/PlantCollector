//
//  AddPlantView.swift
//  PlantCollector
//
//  Created by Sara Lefort on 11/11/2024.
//

import SwiftUI
import PhotosUI

struct AddPlantView: View {
  @Binding var myPlantCollection: [Plant]
  @Environment(\.dismiss) var dismiss
  @State var pickedPhoto:  PhotosPickerItem? = nil
  @State var selectedImage = UIImage()
  
  @State private var selectedCat: String = ""
  
  @State private var name: String = "" //
  @State private var provenance: String = "" //
  @State private var category: Category = Category(name: "", description: "", color: Color.white)
  @State private var image = UIImage() //
  @State private var date: Date = Date() //
  @State private var sunLevel: Int = 0
  @State private var waterFrequency: Int = 0
  @State private var temperatureMin: Int = 0 //
  @State private var temperatureMax: Int = 0 //
  @State private var isSeed: Bool = false //
  @State private var isCutting: Bool = false //
  @State private var price: Double = 0 //
  
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
              .frame(width: .infinity, height: 300)
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
            }
          }
        }
        
        // Nom
        TextField("Nom", text: $name)
          .textFieldStyle(.roundedBorder)
        
        // Provenance
        TextField("Provenance", text: $provenance)
          .textFieldStyle(.roundedBorder)
        
        // Date
        DatePicker("Date", selection: $date, displayedComponents: .date)
        
        // Ensoleillement
//        HStack{
//          Text("Ensoleillement")
//          Spacer()
//          ForEach(0 ..< 5) {_ in
//            Image(systemName: "sun.max")
//              .onTapGesture {
//                
//              }
//          }
//        }
//        .padding([.bottom, .top], 10)
        
        // Arrosage
//        HStack{
//          Text("Arrosage")
//          Spacer()
//          ForEach(0 ..< 5) {_ in
//            Image(systemName: "drop")
//              .onTapGesture {
//                
//              }
//          }
//        }
//        .padding(.bottom, 10)
        
        // Température Max
        HStack{
          Text("Température")
          Spacer()
          Text("min")
          TextField("", value: $temperatureMin, format: .number)
            .textFieldStyle(.roundedBorder)
            .frame(width: 50)
          Text("max")
          TextField("", value: $temperatureMax, format: .number)
            .textFieldStyle(.roundedBorder)
            .frame(width: 50)
        }
        .frame(minWidth: 0, alignment: .leading)
        
        // Semis ?
        HStack{
          Toggle(isOn: $isSeed,
                 label: {
            Text("Semis")
          })
        }
        
        // Bouture ?
        Toggle(isOn: $isCutting,
               label: {
          Text("Bouture")
        })
        
        // Prix
        HStack(spacing: 20){
          Text("Prix")
          TextField("", value: $price, format: .number)
            .textFieldStyle(.roundedBorder)
          Stepper("test", value: $price)
            .labelsHidden()
        }
        
        // Catégorie
//        Picker("Catégorie", selection: $category) {
//            ForEach(previewCatArray) { cat in
//              Text(cat.name).tag(cat.name)
//            }
//          }.pickerStyle(.menu)
          
//        }
        
        // Bouton de sauvegarde
        Button {
          savePlant()
        } label: {
          Text("Créer")
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
    let newPlant = Plant(name: name, provenance: provenance, category: category, image: image, date: date, sunLevel: sunLevel, waterFrequency: waterFrequency, temperatureMin: temperatureMin, temperatureMax: temperatureMax, isSeed: isSeed, isCutting: isCutting, price: price)
    myPlantCollection.append(newPlant)
    dismiss() // Quitter l'écran automatiquement
  }
}


#Preview {
  AddPlantView(myPlantCollection: .constant([]))
}
