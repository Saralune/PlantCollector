//
//  Plant.swift
//  PlantCollector
//
//  Created by Sara Lefort on 11/11/2024.
//

import Foundation

struct Plant : Identifiable {
  let id  = UUID()
  let name: String
  let provenance: String
  let category: Category
  let image: String
  let date: Date
  let sunLevel: Int
  let waterFrequency: Int
  let temperatureMin: Int
  let temperatureMax: Int
  let isSeed: Bool
  let isCutting: Bool
}

let previewPlantImpatiens = Plant(name: "Impatiens 1", provenance: "Bouture de Lagardelle", category: previewCatInt, image: "", date: Date(), sunLevel: 5, waterFrequency: 2, temperatureMin: 10, temperatureMax: 25, isSeed: false, isCutting: true)
let previewPlantOrchidee = Plant(name: "Orchidée", provenance: "Orchidée maman", category: previewCatInt, image: "", date: Date(), sunLevel: 5, waterFrequency: 2, temperatureMin: 10, temperatureMax: 25, isSeed: false, isCutting: false)
let previewPlantSensitive = Plant(name: "Sensistive", provenance: "Graines de la ferme Sainte Marthe", category: previewCatInt, image: "", date: Date(), sunLevel: 5, waterFrequency: 2, temperatureMin: 20, temperatureMax: 25, isSeed: true, isCutting: false)
