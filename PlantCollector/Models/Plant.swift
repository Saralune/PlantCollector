//
//  Plant.swift
//  PlantCollector
//
//  Created by Sara Lefort on 11/11/2024.
//

import Foundation
import PhotosUI

struct Plant : Identifiable {
  let id  = UUID()
  var name: String
  var provenance: String
  var category: Set<Category>
  var image: UIImage
  var date: Date
  var sunLevel: Int
  var waterFrequency: Int
  var temperatureMin: Int
  var temperatureMax: Int
  var isSeed: Bool
  var isCutting: Bool
  var price: Double
}

let previewPlantImpatiens = Plant(name: "Impatiens 1", provenance: "Bouture de Lagardelle", category: [previewCatInt], image: UIImage(imageLiteralResourceName: "Impatiens1"), date: Date(), sunLevel: 5, waterFrequency: 2, temperatureMin: 10, temperatureMax: 25, isSeed: false, isCutting: true, price: 0)
let previewPlantOrchidee = Plant(name: "Orchidée", provenance: "Orchidée maman", category: [previewCatExt], image: UIImage(imageLiteralResourceName:"orchidee"), date: Date(), sunLevel: 5, waterFrequency: 2, temperatureMin: 10, temperatureMax: 25, isSeed: false, isCutting: false, price: 0)
let previewPlantSensitive = Plant(name: "Sensitive", provenance: "Graines de la ferme Sainte Marthe", category: [previewCatSeed, previewCatInt], image: UIImage(imageLiteralResourceName:"sensitive"), date: Date(), sunLevel: 5, waterFrequency: 2, temperatureMin: 20, temperatureMax: 25, isSeed: true, isCutting: false, price: 0)
