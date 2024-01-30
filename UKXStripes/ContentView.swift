//
//  ContentView.swift
//  UKXStripes
//
//  Created by Don Jose on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            let portrait = geometry.size.width < geometry.size.height
            let aspectRatio = portrait ? 1/2.0 : 2/1.0
            
            UnionJack()
                .aspectRatio(aspectRatio, contentMode: .fit)
        }
        .background(Color.black)
    }
}

#Preview {
    ContentView()
}

extension Color {
    static let GBRRed = Color(#colorLiteral(red: 0.7843137255, green: 0.06274509804, blue: 0.1803921569, alpha: 1))
    static let GBRRoyalBlue = Color(#colorLiteral(red: 0.003921568627, green: 0.1294117647, blue: 0.4117647059, alpha: 1))
}

struct UnionJack: View {
    var body: some View {
        VStack (spacing: 0) {
            HStack (spacing: 0) {
                Quadrant()
                    .clipped()
                Quadrant()
                    .rotation3DEffect(.degrees(180), axis: (x: 1.0, y: 0.0, z: 0.0))
                    .clipped()
            }
            HStack (spacing: 0) {
                Quadrant()
                    .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .clipped()
                Quadrant()
                    .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 0.0, z: 1.0))
                    .clipped()
            }
        }
    }
}

struct Quadrant: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let hypotenuse = sqrt(width * width + height * height)
            let portrait = width < height
            let sizeOne = max(width,height) / 30
            let sizeTwo = max(width,height) / 15
            let sizeThree = max(width,height) / 10
            
            let angle: Double = atan(portrait ? 2 : 0.5) * (180/Double.pi)
            
            VStack (spacing: 0) {
                Rectangle()
                    .frame(width: hypotenuse, height: portrait ? sizeOne : sizeThree)
                    .foregroundStyle(Color.white)
                Rectangle()
                    .frame(width: hypotenuse, height: sizeTwo)
                    .foregroundStyle(Color.GBRRed)
                Rectangle()
                    .frame(width: hypotenuse, height: portrait ? sizeThree :sizeOne)
                    .foregroundStyle(Color.white)
            }
            .position(x: width * 0.5, y: height * 0.5)
            .rotationEffect(.degrees(angle))
        }
    }
}
