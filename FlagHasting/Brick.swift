//
//  Brick.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI



struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}


struct Pole: View {
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let poleWidth = screenWidth / 30 // Adjust the width of the pole
        let poleHeight = UIScreen.main.bounds.height / 1.8 // Adjust the height of the pole
        
        VStack(spacing: 0) {
            // Small triangle closing tip (finial) for the top of the pole
            Triangle()
                .fill(Color.brown)
                .frame(width: poleWidth, height: poleWidth / 2) // Adjust the dimensions of the finial
            
            Rectangle()
                .fill(Color.brown) // Color of the flagpole
                .frame(width: poleWidth, height: poleHeight)
        }
    }
}

struct BrickView: View {
    var body: some View {
        VStack(spacing: 0) {

            Spacer() // Add spacer to separate the layers
            
            Pole()
            
            // Second Layer of Bricks
            HStack(spacing: 0) {
                //HalfBrick() // Add the HalfBrick at the beginning of the second layer
                ForEach(0..<3, id: \.self) { brickIndex in
                    Brick()
                }
            }

            
            // Second Layer of Bricks
            HStack(spacing: 0) {
                //HalfBrick() // Add the HalfBrick at the beginning of the second layer
                ForEach(0..<4, id: \.self) { brickIndex in
                    Brick()
                }
            }

            // Second Layer of Bricks
            HStack(spacing: 0) {
                //HalfBrick() // Add the HalfBrick at the beginning of the second layer
                ForEach(0..<5, id: \.self) { brickIndex in
                    Brick()
                }
            }

            // First Layer of Bricks
            HStack(spacing: 0) {
                ForEach(0..<6, id: \.self) { brickIndex in
                    Brick()
                }
            }

        }
        .frame(maxHeight: .infinity) // Make sure the VStack occupies the full height
    }
}

struct HalfBrick: View {
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let brickW = screenWidth / 6 // Calculate brick width as 1/6 of the screen width
        
        Rectangle()
            .fill(Color.blue) // Transparent background for half brick
            .frame(width: brickW / 2, height: 25)
    }
}

struct Brick: View {
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let brickW = screenWidth / 6 // Calculate brick width as 1/6 of the screen width
        
        ZStack {
            Rectangle()
                .fill(Color.red.opacity(0.5)) // Light gray background for the brick
                .frame(width: brickW, height: 25)
                .overlay(
                    // Custom strikes
                    ZStack {
                        ForEach(0..<4) { index in
                            Path { path in
                                let startY = CGFloat(index) * 6
                                path.move(to: CGPoint(x: 5, y: 5 + startY))
                                path.addLine(to: CGPoint(x: brickW - 5, y: 5 + startY))
                            }
                            .stroke(Color.gray, lineWidth: 1.5)
                        }
                    }
                )
                .border(Color.gray, width: 1.5) // Gray stroke around the brick
            
            // Text "APK" on the brick with transparent background
            Text("APK")
                .font(.system(size: 12, weight: .bold)) // Reduced font size
                .foregroundColor(.white.opacity(0.5)) // Set text color to light white
                .background(Color.gray.opacity(0.5)) // Set background color with transparency
                .frame(width: brickW - 10, height: 20) // Adjust the frame size of the text
                .cornerRadius(5) // Add corner radius for a more elegant look
        }
    }
}

// Preview the BrickView with the correct layout
//struct BrickView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//                BrickView()
//                // You can add more components or modify the stage layout here if needed.
//        }
//    }
//}

// Preview the BrickView with the correct layout
struct BrickView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
//            Pole()
//                .offset(y: -UIScreen.main.bounds.height / 4)
            BrickView()
            // Position the pole above the center
            // You can add more components or modify the stage layout here if needed.
        }
    }
}
