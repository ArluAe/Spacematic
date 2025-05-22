//
//  Components.swift
//  Spacematic
//
//  Created by Charles-An on 04/02/2024.
//
// © 2024 Charles-Andrea GRAVIER. All rights reserved



import Foundation
import SpriteKit
import GameplayKit
import SwiftUI

// Game
    // Nodes
var player = SKSpriteNode()
var projectile = SKSpriteNode()
var enemy = SKSpriteNode()
var answerLabel = CGFloat(40)
var randomTime1 = 2
var randomTime2 = 5
var star = SKShapeNode()
    // Labels
var scoreLabel = SKLabelNode()
var mainLabel = SKLabelNode()
    // Nodes Parameter
var playerSize = CGSize(width: 91/1.5, height: 200/1.5)
var projectileSize = CGSize(width: 10, height: 10)
//var enemySize = CGSize(width: Int.random(in: 40...80), height: Int.random(in: 40...80))
var starSize = CGSize()
    // Color Palette - Modern Space Theme
var spaceBlack = UIColor(red: 0.05, green: 0.05, blue: 0.1, alpha: 1.0)
var cosmicPurple = UIColor(red: 0.4, green: 0.2, blue: 0.6, alpha: 1.0)
var deepBlue = UIColor(red: 0.1, green: 0.2, blue: 0.4, alpha: 1.0)
var nebulaPink = UIColor(red: 0.95, green: 0.4, blue: 0.7, alpha: 1.0)
var celestialTeal = UIColor(red: 0.2, green: 0.8, blue: 0.8, alpha: 1.0)
var starYellow = UIColor(red: 1.0, green: 0.95, blue: 0.4, alpha: 1.0)
var meteorOrange = UIColor(red: 0.95, green: 0.6, blue: 0.1, alpha: 1.0)
var glowingGreen = UIColor(red: 0.3, green: 0.9, blue: 0.4, alpha: 1.0)

// Legacy colors kept for compatibility
var offBlackColor = UIColor(red: 0.35, green: 0.25, blue: 0.45, alpha: 1.0)
var offWhiteColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
var greenColor = UIColor(red: 0.7, green: 1.0, blue: 0.2, alpha: 1)
var orangeCustomColor = UIColor.orange

// Game UI Colors
var primaryBackgroundColor = spaceBlack
var accentColor = celestialTeal
var highlightColor = glowingGreen
var warningColor = meteorOrange
var textColor = offWhiteColor
var selectedColor = nebulaPink

    // Time Intervals
var fireProjectileRate = 0.2
var projectileSpeed = 0.9

var enemySpeed = 2.1
var enemySpawnRate = 0.5
var starSpeed = 1.1
    // Touch Location
var touchLocation = CGPoint()

// General
// var gameIsOver = false
//var isAlive = true
//var score = 0


var labelMain1 = SKLabelNode()
var labelMain2 = SKLabelNode()
var labelMain3 = SKLabelNode()
var circle1 = SKSpriteNode()
var circle2 = SKSpriteNode()
var circle3 = SKSpriteNode()
var problem = SKShapeNode()
var textProblem = SKLabelNode()

var nodesY = 1100
var nodesSpeed = 4.2
var nodesSpawnRate = 4.2

var totalNodes: [SKNode] = []

// Define reusable view modifiers
struct NeumorphicStyle: ViewModifier {
    var isPressed: Bool
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(color)
                    .shadow(color: Color.black.opacity(0.2), radius: isPressed ? 2 : 10, x: isPressed ? 2 : 5, y: isPressed ? 2 : 5)
                    .shadow(color: Color.white.opacity(0.1), radius: isPressed ? 2 : 5, x: isPressed ? -2 : -5, y: isPressed ? -2 : -5)
            )
    }
}

extension View {
    func neumorphic(isPressed: Bool, color: Color) -> some View {
        self.modifier(NeumorphicStyle(isPressed: isPressed, color: color))
    }
}

struct DifficultyBarView: View {
    @Binding var backColorD1: Color
    @Binding var backColorD2: Color
    @Binding var backColorD3: Color
    @State private var isD1Pressed: Bool = false
    @State private var isD2Pressed: Bool = false
    @State private var isD3Pressed: Bool = false
    
    private let baseColor = Color(UIColor.systemIndigo)
    private let activeColor = Color(red: 0.3, green: 0.9, blue: 0.4)
    private let starColor = Color.yellow
    private let shadowColor = Color.black.opacity(0.3)
    
    var body: some View {
        HStack(spacing: 15) {
            difficultyButton(
                isSelected: backColorD1 != .clear,
                isPressed: $isD1Pressed,
                stars: 1,
                action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        backColorD1 = backColorD1 == .clear ? activeColor : .clear
                        backColorD2 = .clear
                        backColorD3 = .clear
                    }
                }
            )
            
            difficultyButton(
                isSelected: backColorD2 != .clear,
                isPressed: $isD2Pressed,
                stars: 2,
                action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        backColorD2 = backColorD2 == .clear ? activeColor : .clear
                        backColorD1 = .clear
                        backColorD3 = .clear
                    }
                }
            )
            
            difficultyButton(
                isSelected: backColorD3 != .clear,
                isPressed: $isD3Pressed,
                stars: 3,
                action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        backColorD3 = backColorD3 == .clear ? activeColor : .clear
                        backColorD1 = .clear
                        backColorD2 = .clear
                    }
                }
            )
        }
        .padding(.vertical, 8)
    }
    
    private func difficultyButton(isSelected: Bool, isPressed: Binding<Bool>, stars: Int, action: @escaping () -> Void) -> some View {
        ZStack {
            // Background with glow effect when selected
            RoundedRectangle(cornerRadius: 22)
                .fill(isSelected ? activeColor : Color.clear)
                .frame(width: 120, height: 80)
                .shadow(color: isSelected ? activeColor.opacity(0.6) : Color.clear, radius: 8)
            
            // Button background
            RoundedRectangle(cornerRadius: 20)
                .fill(baseColor)
                .frame(width: 110, height: 70)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isSelected ? Color.white : Color.clear, lineWidth: 2)
                )
                .shadow(color: shadowColor, radius: isPressed.wrappedValue ? 2 : 4, x: 0, y: isPressed.wrappedValue ? 1 : 2)
            
            // Star content
            HStack(spacing: 8) {
                ForEach(0..<stars, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(starColor)
                        .shadow(color: starColor.opacity(0.7), radius: isSelected ? 3 : 0)
                        .scaleEffect(isSelected ? 1.1 : 1.0)
                }
            }
            .font(.system(size: 20, weight: .bold))
        }
        .scaleEffect(isPressed.wrappedValue ? 0.97 : 1.0)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed.wrappedValue = true }
                .onEnded { _ in
                    isPressed.wrappedValue = false
                    action()
                }
        )
    }
}

struct GameModeBarView: View {
    @Binding var backColorM1: Color
    @Binding var backColorM2: Color
    @State private var isM1Pressed: Bool = false
    @State private var isM2Pressed: Bool = false
    
    private let baseColor = Color(UIColor.systemIndigo)
    private let activeColor = Color(red: 0.3, green: 0.9, blue: 0.4)
    private let textColor = Color.white
    
    var body: some View {
        HStack(spacing: 20) {
            gameModeButton(
                isSelected: backColorM1 != .clear,
                isPressed: $isM1Pressed,
                icon: "➕✖️🟰",
                title: "Math",
                action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        backColorM1 = backColorM1 == .clear ? activeColor : .clear
                        backColorM2 = .clear
                    }
                }
            )
            
            gameModeButton(
                isSelected: backColorM2 != .clear,
                isPressed: $isM2Pressed,
                icon: "🌍🌎🌏",
                title: "Geo",
                action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        backColorM2 = backColorM2 == .clear ? activeColor : .clear
                        backColorM1 = .clear
                    }
                }
            )
        }
        .padding(.vertical, 10)
    }
    
    private func gameModeButton(isSelected: Bool, isPressed: Binding<Bool>, icon: String, title: String, action: @escaping () -> Void) -> some View {
        ZStack {
            // Background with glow effect when selected
            RoundedRectangle(cornerRadius: 22)
                .fill(isSelected ? activeColor : Color.clear)
                .frame(width: 160, height: 95)
                .shadow(color: isSelected ? activeColor.opacity(0.6) : Color.clear, radius: 8)
            
            // Button background
            RoundedRectangle(cornerRadius: 20)
                .fill(baseColor)
                .frame(width: 150, height: 85)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isSelected ? Color.white : Color.clear, lineWidth: 2)
                )
                .shadow(color: Color.black.opacity(0.3), radius: isPressed.wrappedValue ? 2 : 4, x: 0, y: isPressed.wrappedValue ? 1 : 2)
            
            // Content
            VStack(spacing: 6) {
                Text(icon)
                    .font(.system(size: 26))
                    .shadow(color: isSelected ? Color.white.opacity(0.7) : Color.clear, radius: 2)
                
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(textColor)
                    .opacity(isSelected ? 1.0 : 0.9)
            }
        }
        .scaleEffect(isPressed.wrappedValue ? 0.97 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed.wrappedValue)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed.wrappedValue = true }
                .onEnded { _ in
                    isPressed.wrappedValue = false
                    action()
                }
        )
    }
}














