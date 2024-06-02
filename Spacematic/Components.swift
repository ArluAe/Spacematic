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
    // Color
var offBlackColor = UIColor(red: 0.35, green: 0.25, blue: 0.45, alpha: 1.0)
var offWhiteColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
var greenColor = UIColor(red: 0.7, green: 1.0, blue: 0.2, alpha: 1)
var orangeCustomColor = UIColor.orange
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








struct DifficultyBarView: View {
    @Binding var backColorD1: Color
    @Binding var backColorD2: Color
    @Binding var backColorD3: Color
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .frame(width: 110, height: 70)
                    .foregroundColor(backColorD1)
                    .cornerRadius(30)
                Rectangle()
                    .frame(width: 100, height: 60)
                    .foregroundColor(.purple)
                    .cornerRadius(30)
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        
                }
            }
            .padding(3)
            .onTapGesture {
                if backColorD1 == .clear {
                    backColorD1 = Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1)
                    backColorD2 = .clear
                    backColorD3 = .clear
                }
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 110, height: 70)
                    .foregroundColor(backColorD2)
                    .cornerRadius(30)
                Rectangle()
                    .frame(width: 100, height: 60)
                    .foregroundColor(.purple)
                    .cornerRadius(30)
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                       
                }
            }
            .padding(3)
            .onTapGesture {
                if backColorD2 == .clear {
                    backColorD2 = Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1)
                    backColorD1 = .clear
                    backColorD3 = .clear
                }
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 110, height: 70)
                    .foregroundColor(backColorD3)
                    .cornerRadius(30)
                Rectangle()
                    .frame(width: 100, height: 60)
                    .foregroundColor(.purple)
                    .cornerRadius(30)
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        
                }
            }
            .padding(3)
            .onTapGesture {
                if backColorD3 == .clear {
                    backColorD3 = Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1)
                    backColorD2 = .clear
                    backColorD1 = .clear
                }
            }
        }
    }
}

/*struct DifficultyBarView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyBarView()
    }
}*/





struct GameModeBarView: View {
    @Binding var backColorM1: Color
    @Binding var backColorM2: Color
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .frame(width: 110*(3/2), height: 70)
                    .foregroundColor(backColorM1)
                    .cornerRadius(30)
                Rectangle()
                    .frame(width: 100*(3/2), height: 60)
                    .foregroundColor(.purple)
                    .cornerRadius(30)
                HStack(spacing: 5) {
                    Text("➕✖️🟰")
                        .font(.title)
                }
            }
            .padding(9)
            .onTapGesture {
                if backColorM1 == .clear {
                    backColorM1 = Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1)
                    backColorM2 = .clear
                }
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 110*(3/2), height: 70)
                    .foregroundColor(backColorM2)
                    .cornerRadius(30)
                Rectangle()
                    .frame(width: 100*(3/2), height: 60)
                    .foregroundColor(.purple)
                    .cornerRadius(30)
                HStack(spacing: 5) {
                    Text("🌍🌎🌏")
                        .font(.title)
                }
            }
            .padding(9)
            .onTapGesture {
                if backColorM2 == .clear {
                    backColorM2 = Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1)
                    backColorM1 = .clear
                }
            }
            
        }
    }
}














