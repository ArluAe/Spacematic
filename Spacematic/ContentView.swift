//
//  ContentView.swift
//  Spacematic
//
//  Created by Charles-An on 04/02/2024.
//
// © 2024 Charles-Andrea GRAVIER. All rights reserved

import SwiftUI

struct ContentView: View {
   
    init() {
        // Apply a gradient background to the tab bar
        let appearance = UITabBarAppearance()
        let gradient = UIImage.gradientImage(
            from: UIColor(red: 0.3, green: 0.15, blue: 0.5, alpha: 0.95),
            to: UIColor(red: 0.2, green: 0.1, blue: 0.3, alpha: 0.95),
            size: CGSize(width: 1, height: 80)
        )
        appearance.backgroundImage = gradient
        appearance.shadowColor = .clear
        
        // Configure tab bar item appearance
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = UIColor(red: 0.6, green: 0.6, blue: 0.7, alpha: 0.8)
        itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.7, alpha: 0.8)]
        itemAppearance.selected.iconColor = UIColor(red: 0.3, green: 0.9, blue: 0.4, alpha: 1.0)
        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.3, green: 0.9, blue: 0.4, alpha: 1.0)]
        
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.inlineLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance
        
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        ZStack {
            // Create a gradient space background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.05, green: 0.05, blue: 0.12),
                    Color(red: 0.1, green: 0.07, blue: 0.18),
                    Color(red: 0.05, green: 0.05, blue: 0.1)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea(.all)
            
            // Add subtle star particles
            StarsBackgroundView()
                .opacity(0.7)
            
            GameMenuView()
        }
    }
}

// Custom view to create a starry space background
struct StarsBackgroundView: View {
    let starsCount = 100
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<starsCount, id: \.self) { i in
                    Circle()
                        .fill(
                            Color.white.opacity(Double.random(in: 0.1...0.7))
                        )
                        .frame(width: randomSize(), height: randomSize())
                        .position(
                            x: CGFloat.random(in: 0...geometry.size.width),
                            y: CGFloat.random(in: 0...geometry.size.height)
                        )
                        .blur(radius: Bool.random() ? 0 : 0.5)
                        // Add subtle twinkling animation
                        .modifier(TwinkleModifier())
                }
            }
        }
    }
    
    // Return random star size
    private func randomSize() -> CGFloat {
        let baseSize = CGFloat.random(in: 1...3)
        // Make some stars bigger, but keep most small
        return Bool.random() && Bool.random() ? baseSize * 2 : baseSize
    }
}

// Animation modifier for twinkling stars
struct TwinkleModifier: ViewModifier {
    @State private var isAnimating = false
    
    func body(content: Content) -> some View {
        content
            .opacity(isAnimating ? Double.random(in: 0.5...1.0) : Double.random(in: 0.2...0.8))
            .animation(
                Animation.easeInOut(duration: Double.random(in: 1.0...3.0))
                    .repeatForever(autoreverses: true)
                    .delay(Double.random(in: 0...3.0)),
                value: isAnimating
            )
            .onAppear { isAnimating = true }
    }
}

// Extension to create gradient UIImage for tab bar
extension UIImage {
    static func gradientImage(from: UIColor, to: UIColor, size: CGSize) -> UIImage? {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(origin: .zero, size: size)
        gradient.colors = [from.cgColor, to.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
