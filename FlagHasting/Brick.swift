//
//  Brick.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI


struct HumanView: View {
    var body: some View {
        Image("human") // Make sure "human.png" is added to the asset catalog
            .resizable()
            .frame(width: 40, height: 80) // Adjust the size of the human image
            .scaledToFill() // Maintain aspect ratio of the image
    }
}

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
    @State private var humanPosition: CGPoint = CGPoint(x: 180, y: 585) // Initial position
    @State private var targetPosition: CGPoint = CGPoint(x: 180, y: 585) // Current target position
    
    
    private var brickWidth: CGFloat {
        UIScreen.main.bounds.width / 6 // Calculate brick width as 1/6 of the screen width
    }

    // Function to update the target position based on the current position
    private func updateTargetPosition() {
        let screenWidth = UIScreen.main.bounds.width
        let newY = targetPosition.y - 25 // 25 is brick height
        let humanXMove = screenWidth / 6 // Calculate brick width as 1/6 of the screen width
        let newX = targetPosition.x - (humanXMove/2)
        

        if (newY < 500) {
            targetPosition = CGPoint(x: newX - 30 , y: newY + 25) // Move to 3rd layer
        } else {
            targetPosition = CGPoint(x: newX , y: newY) // Move to 3rd layer

        }
        print(newX, newY)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer() // Add spacer to separate the layers
            
            
            // Add the human view below the layers and set its position
            Image("human")
                .resizable()
                .scaledToFit() // Keep the image with correct aspect ratio and small size
                .frame(width: 60, height: 120) // Set the desired size of the human image
                .offset(x: humanPosition.x, y: humanPosition.y)
                .animation(.easeInOut) // Add animation to the movement
            
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
        .onTapGesture {
            updateTargetPosition() // Update the target position on each tap
            humanPosition = targetPosition // Animate the human to the target position
        }
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
struct BrickView_Previews: PreviewProvider {
    static var previews: some View {
        BrickView()
    }
}
