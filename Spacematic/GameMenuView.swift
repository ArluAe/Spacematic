//
//  GameMenuView.swift
//  Spacematic
//
//  Created by Charles-An on 04/02/2024.
//
// © 2024 Charles-Andrea GRAVIER. All rights reserved

import SwiftUI
import _SpriteKit_SwiftUI

struct GameMenuView: View {
    // MARK: - State Properties
    @State private var score1 = 0
    @State private var score2 = 0
    @StateObject var scene: GameScene = {
        let scene = GameScene()
        scene.size = CGSize(width: 560, height: 830-120)
        scene.scaleMode = .fill
        return scene
    }()
    
    @State private var showingSheet = false
    @State private var isScaled = false
    @State var gameIsInProgress = false
    @State private var isVisible = false
    @State var gameOverTextY = -300
    @State var difficulty = "easy"
    
    // Use our new color scheme from Components.swift
    @State var backColorD1: Color = Color(red: 0.3, green: 0.9, blue: 0.4)
    @State var backColorD2: Color = .clear
    @State var backColorD3: Color = .clear
    
    @State var backColorM1: Color = Color(red: 0.3, green: 0.9, blue: 0.4)
    @State var backColorM2: Color = .clear
    
    // Title animation properties
    @State private var titleGlow = false
    @State private var titleOffset: CGFloat = 0
    @State private var buttonGlow = false
    
    var body: some View {
        ZStack {
            // Base background - replaced with ContentView's gradient
            Color(UIColor.systemIndigo).opacity(0.1)
                .ignoresSafeArea()
            
            if gameIsInProgress {
                gameView
            } else if !gameIsInProgress && !scene.gameIsOver {
                mainMenuView
            }
            
            if gameIsInProgress && scene.gameIsOver {
                gameOverView
            }
        }
    }
    
    // MARK: - Game View
    private var gameView: some View {
        VStack {
            SpriteView(scene: scene)
                .frame(width: 560, height: 830-120)
                .ignoresSafeArea()
                .transition(.opacity.combined(with: .scale(scale: 1.05)))
        }
    }
    
    // MARK: - Main Menu View
    private var mainMenuView: some View {
        ZStack {
            VStack {
                Spacer()
                
                // Game Title with enhanced animation
                Text("Spacematic")
                    .font(.system(size: 48, weight: .heavy, design: .rounded))
                    .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4))
                    .shadow(color: titleGlow ? 
                            Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.8) : 
                            Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.3),
                            radius: titleGlow ? 10 : 5)
                    .offset(y: titleOffset)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                            titleGlow = true
                            titleOffset = -5
                        }
                    }
                
                Spacer()
                
                // Play Button with enhanced design
                playButton
                
                // Difficulty and Game Mode Selection
                VStack(spacing: 25) {
                    DifficultyBarView(backColorD1: $backColorD1, backColorD2: $backColorD2, backColorD3: $backColorD3)
                    GameModeBarView(backColorM1: $backColorM1, backColorM2: $backColorM2)
                }
                .padding(30)
                
                Spacer(minLength: 80)
            }
            
            // Book button positioned on the bottom right
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    bookButton
                }
                .padding(20)
            }
        }
        .frame(width: 560, height: 830-120)
    }
    
    // Play button with improved design
    private var playButton: some View {
        Button(action: {
            handlePlayButtonTap()
        }) {
            ZStack {
                // Outer glow
                Circle()
                    .fill(Color(red: 0.3, green: 0.9, blue: 0.4).opacity(buttonGlow ? 0.3 : 0.1))
                    .frame(width: 170, height: 170)
                    .blur(radius: 10)
                
                // Button base
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 0.15, green: 0.15, blue: 0.25),
                                Color(red: 0.2, green: 0.2, blue: 0.35)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 150, height: 150)
                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                
                // Play icon
                Image(systemName: "play.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4))
                    .frame(width: 60, height: 60)
                    .shadow(color: Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.8), radius: 8)
            }
            .scaleEffect(isScaled ? 1.05 : 1.0)
            .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: isScaled)
            .onAppear {
                isScaled = true
                withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    buttonGlow = true
                }
            }
        }
    }
    
    // Book button with improved design
    private var bookButton: some View {
        Button(action: {
            showingSheet.toggle()
        }) {
            ZStack {
                // Button background
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 0.4, green: 0.2, blue: 0.6),
                                Color(red: 0.3, green: 0.1, blue: 0.5)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                    .shadow(color: Color.black.opacity(0.5), radius: 5)
                
                // Icon
                Image(systemName: "book.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4))
                    .frame(width: 35, height: 35)
                    .shadow(color: Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.6), radius: 4)
            }
        }
        .sheet(isPresented: $showingSheet) {
            bookView(showingSheet: $showingSheet)
        }
    }
    
    // MARK: - Game Over View
    private var gameOverView: some View {
        ZStack {
            // Blurred overlay for game over screen
            Color.black.opacity(0.6)
                .ignoresSafeArea()
                .blur(radius: 2)
            
            // Game over card with glass morphism effect
            VStack(spacing: 20) {
                Text("Game Over")
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                    .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4))
                    .shadow(color: Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.7), radius: 5)
                
                VStack(spacing: 10) {
                    Text("Score: \(scene.score)")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text("Best: \(String(select(gameMode: scene.gameMode)!))")
                        .font(.system(size: 24, weight: .medium, design: .rounded))
                        .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4))
                }
                
                // Restart button
                Button(action: {
                    gameIsInProgress = false
                    scene.gameIsOver = false
                    isScaled = false
                    scene.score = 0
                }) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0.2, green: 0.2, blue: 0.3),
                                        Color(red: 0.1, green: 0.1, blue: 0.2)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 80, height: 80)
                            .shadow(color: Color.black.opacity(0.5), radius: 10)
                        
                        Image(systemName: "arrow.counterclockwise")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4))
                            .frame(width: 30, height: 30)
                            .shadow(color: Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.7), radius: 4)
                    }
                    .scaleEffect(isScaled ? 1.05 : 1.0)
                    .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: isScaled)
                }
            }
            .padding(40)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.black.opacity(0.6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.7),
                                        Color(red: 0.2, green: 0.4, blue: 0.8).opacity(0.5),
                                        Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.3)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2
                            )
                    )
                    .shadow(color: Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.3), radius: 20)
            )
            .opacity(isVisible ? 1 : 0)
            .scaleEffect(isVisible ? 1 : 0.9)
            .onAppear {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    isVisible = true
                }
            }
        }
    }
    
    // MARK: - Helper Methods
    private func handlePlayButtonTap() {
        // Apply difficulty settings
        if backColorD1 != .clear {
            scene.difficulty = "easy"
        } else if backColorD2 != .clear {
            scene.difficulty = "medium"
        } else if backColorD3 != .clear {
            scene.difficulty = "hard"
        }
        
        // Apply game mode settings
        if backColorM1 != .clear {
            scene.gameMode = "maths"
        } else if backColorM2 != .clear {
            scene.gameMode = "geography"
        }
        
        gameOverTextY = -1000
        
        // Start game with animation
        withAnimation(.easeIn(duration: 0.3)) {
            gameIsInProgress = true
        }
    }
}

struct shopView: View {
    @Binding var showingSheet: Bool
    
    var body: some View {
        ZStack {
            // Modern gradient background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.05, blue: 0.2),
                    Color(red: 0.2, green: 0.1, blue: 0.3),
                    Color(red: 0.1, green: 0.05, blue: 0.2)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Add subtle star particles
            StarsBackgroundView()
                .opacity(0.3)
            
            VStack(spacing: 20) {
                closeButton
                
                Spacer()
                
                ScrollView {
                    // Shop content would go here
                }
            }
            .padding()
        }
    }
    
    private var closeButton: some View {
        Button(action: {
            withAnimation(.spring()) {
                showingSheet = false
            }
        }) {
            Text("Done")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4))
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(
                    Capsule()
                        .fill(Color(red: 0.2, green: 0.1, blue: 0.3))
                        .shadow(color: Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.3), radius: 5)
                )
        }
        .padding(.top, 20)
    }
}

struct bookView: View {
    @State private var showingSheet1 = false
    @Binding var showingSheet: Bool
    
    var body: some View {
        ZStack {
            // Modern gradient background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.05, blue: 0.2),
                    Color(red: 0.2, green: 0.1, blue: 0.3),
                    Color(red: 0.1, green: 0.05, blue: 0.2)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Add subtle star particles
            StarsBackgroundView()
                .opacity(0.3)
            
            VStack {
                closeButton
                
                Spacer()
                
                ScrollView {
                    VStack(spacing: 30) {
                        scoreTable
                        creditSection
                    }
                    .padding()
                }
            }
        }
    }
    
    private var closeButton: some View {
        Button(action: {
            withAnimation(.spring()) {
                showingSheet = false
            }
        }) {
            Text("Done")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4))
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(
                    Capsule()
                        .fill(Color(red: 0.2, green: 0.1, blue: 0.3))
                        .shadow(color: Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.3), radius: 5)
                )
        }
        .padding(.top, 20)
    }
    
    private var scoreTable: some View {
        VStack {
            Text("High Scores")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4))
                .padding(.bottom, 10)
                .shadow(color: Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.5), radius: 4)
            
            VStack(spacing: 0) {
                // Headers
                HStack(spacing: 0) {
                    tableHeader(text: "Game Mode")
                    tableHeader(text: "Best Score")
                }
                
                // Math row
                HStack(spacing: 0) {
                    tableCell(text: "Mental Maths", isTitle: true)
                    tableCell(text: String(select(gameMode: "maths")!), isScore: true)
                }
                
                // Geography row
                HStack(spacing: 0) {
                    tableCell(text: "Geography", isTitle: true)
                    tableCell(text: String(select(gameMode: "geography")!), isScore: true)
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.6), lineWidth: 1)
                    .shadow(color: Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.3), radius: 10)
            )
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
    
    private func tableHeader(text: String) -> some View {
        Text(text)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4))
            .background(Color(red: 0.15, green: 0.1, blue: 0.25))
            .border(Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.6), width: 1)
    }
    
    private func tableCell(text: String, isTitle: Bool = false, isScore: Bool = false) -> some View {
        Text(text)
            .font(.system(
                size: isScore ? 24 : 16,
                weight: isTitle || isScore ? .semibold : .regular,
                design: .rounded
            ))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .foregroundColor(isScore ? Color(red: 0.3, green: 0.9, blue: 0.4) : .white)
            .background(Color(red: 0.2, green: 0.15, blue: 0.3).opacity(0.7))
            .border(Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.6), width: 1)
    }
    
    private var creditSection: some View {
        VStack(spacing: 15) {
            Divider()
                .background(Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.3))
                .padding(.vertical, 10)
            
            VStack(spacing: 10) {
                creditText(title: "Made by:", name: "Charles-A. Gravier Morin")
                creditText(title: "Music:", name: "Thomas Mosen")
                
                Text("Copyright © 2024. Version 2.0.")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.8))
                    .padding(.top, 5)
            }
        }
    }
    
    private func creditText(title: String, name: String) -> some View {
        HStack(spacing: 8) {
            Text(title)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.7))
            
            Text(name)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundColor(Color(red: 0.3, green: 0.9, blue: 0.4).opacity(0.8))
        }
    }
}

// MARK: - Preview
struct GameMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GameMenuView()
    }
}
