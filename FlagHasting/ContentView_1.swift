////
////  ContentView.swift
////  FlagHasting
////
////  Created by Pavankumar Arepu on 28/07/23.
////
//
//import SwiftUI
//
//struct FlagStageView: View {
//    @State private var isAnimating = false
//
//    var body: some View {
//        GeometryReader { geometry in
//            let stageWidth = geometry.size.width - 20 // 10px on each side
//            let stageHeight = geometry.size.height / 10 // Dividing the height into 10 parts for now
//
//            ZStack {
//                // Base (Big Circle)
//                Ellipse()
//                    .foregroundColor(.brown) // Fill the ellipse with brown color
//                    .frame(width: isAnimating ? stageWidth : 0, height: isAnimating ? stageHeight : 0)
//                    .offset(y: stageHeight * 4.5) // Centered horizontally and slightly above center vertically
//
//                // Single line (horizontal)
//                Rectangle()
//                    .foregroundColor(.black)
//                    .frame(width: 5, height: 75)
//                    .offset(x: isAnimating ? -(stageWidth / 2 - 2.5) : 0, y: isAnimating ? (stageHeight * 5.5) - 37.5 : stageHeight * 6.5) // Adjusted y-offset to move the line closer to the ellipse
//
//                // Single line (vertical - left side)
//                Rectangle()
//                    .foregroundColor(.black)
//                    .frame(width: 5, height: 100)
//                    .offset(x: isAnimating ? -(stageWidth / 2 - 2.5) : 0, y: isAnimating ? stageHeight * 5 : stageHeight * 6) // Starting from the leftmost side of the ellipse and going up to a height of 100 pixels
//
//                // Single line (vertical - right side)
//                Rectangle()
//                    .foregroundColor(.black)
//                    .frame(width: 5, height: 100)
//                    .offset(x: isAnimating ? (stageWidth / 2 - 2.5) : 0, y: isAnimating ? stageHeight * 5 : stageHeight * 6) // Starting from the rightmost side of the ellipse and going up to a height of 100 pixels
//            }
//            .padding(.horizontal, 10) // Add a 10-pixel gap on both leading and trailing sides
//            .onAppear {
//                withAnimation(.easeInOut(duration: 1.0).delay(0.5)) {
//                    isAnimating = true
//                }
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//    }
//}
////
////struct ContentView: View {
////    var body: some View {
////        FlagStageView()
////    }
////}
////
////struct ContentView_Previews: PreviewProvider {
////    static var previews: some View {
////        ContentView()
////    }
////}
