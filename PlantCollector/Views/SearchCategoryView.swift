//
//  SearchCategoryView.swift
//  PlantCollector
//
//  Created by Sara Lefort on 14/11/2024.
//

import SwiftUI

struct SearchCategoryView: View {
  @Binding var selection: Set<Category> // will contain categories selected

    var body: some View {
      HStack{
        ForEach(Array(previewCategories), id: \.id){ cat in
          Button(action: {
            if selection.contains(cat) {
              selection.remove(cat)
            } else {
              selection.insert(cat)
            }
            print(selection)
          }) {
            Text(cat.name).tag(cat)
                            .padding(7)
                            .background(cat.color)
                            .opacity(selection.contains(cat) ? 0.8 : 0.3)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .bold()
                            .foregroundStyle(.white)
          }
          .buttonStyle(.plain)
        }
      }
    }
}

#Preview {
  SearchCategoryView(selection: .constant(previewCategories))
//  SearchCategoryView(cat: previewCatExt) // 1 catégorie
}
