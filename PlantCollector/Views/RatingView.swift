//
//  RatingView.swift
//  PlantCollector
//
//  Created by Sara Lefort on 14/11/2024.
//

import SwiftUI

struct RatingView: View {
  @State var rating: Int
  var ratingImageName: String
  
  var label = ""
  var maxRating = 5
  
  var offImage: Image?
  var onImage: Image {
    Image(systemName: ratingImageName + ".fill")
  }
  
  var offColor = Color.gray
  var onColorYellow = Color.yellow
  var onColorBlue = Color.blue
  
    var body: some View {
      HStack{
        if !label.isEmpty {
           Text(label)
        }
        
        ForEach(1..<maxRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : chooseColor())
                }
            }
      }
      .buttonStyle(.plain)
    }
  
  func image(for number:Int) -> Image {
    if number > rating {
      offImage ?? onImage
    } else {
      onImage
    }
  }
  
  func chooseColor() -> Color {
    switch ratingImageName{
//    case "sun": return Color.yellow
    case "drop":
      return Color.blue
    default:
      return Color.yellow
      
    }
  }
}

#Preview {
  RatingView(rating: 1, ratingImageName: "drop")
}
