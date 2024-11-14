//
//  Category.swift
//  PlantCollector
//
//  Created by Sara Lefort on 11/11/2024.
//

import Foundation
import SwiftUI

struct Category : Identifiable, Hashable {
  let id = UUID()
  let name: String
  let description: String
  let color: Color
}

let previewCatInt = Category(name: "Intérieur", description: "Pour les plantes d'interieur", color: .blue)
let previewCatExt = Category(name: "Extérieur", description: "Pour les plantes d'extérieur", color: .yellow)
let previewCatSeed = Category(name: "Semis", description: "Bah les semis quoi", color: .green)
let previewCatDefault = Category(name: "Catégorie", description: "Catégorie par défaut", color: .orange)

let previewCatArray = [previewCatInt, previewCatExt, previewCatSeed]
