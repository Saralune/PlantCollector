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
  let name: String
  let provenance: String
  let category: [Category] 
  let image: UIImage
  let date: Date
  let sunLevel: Int
  let waterFrequency: Int
  let temperatureMin: Int
  let temperatureMax: Int
  let isSeed: Bool
  let isCutting: Bool
  let price: Double
}

let previewPlantImpatiens = Plant(name: "Impatiens 1", provenance: "Bouture de Lagardelle", category: [previewCatInt], image: UIImage(imageLiteralResourceName: "Impatiens1"), date: Date(), sunLevel: 5, waterFrequency: 2, temperatureMin: 10, temperatureMax: 25, isSeed: false, isCutting: true, price: 12)
let previewPlantOrchidee = Plant(name: "Orchidée", provenance: "Orchidée maman", category: [previewCatExt], image: UIImage(imageLiteralResourceName:"orchidee"), date: Date(), sunLevel: 5, waterFrequency: 2, temperatureMin: 10, temperatureMax: 25, isSeed: false, isCutting: false, price: 0)
let previewPlantSensitive = Plant(name: "Sensitive", provenance: "Graines de la ferme Sainte Marthe", category: [previewCatSeed, previewCatInt], image: UIImage(imageLiteralResourceName:"sensitive"), date: Date(), sunLevel: 5, waterFrequency: 2, temperatureMin: 20, temperatureMax: 25, isSeed: true, isCutting: false, price: 0)
