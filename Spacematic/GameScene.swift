//
//  GameScene.swift
//  Spacematic
//
//  Created by Charles-An on 04/02/2024.
//
// © 2024 Charles-Andrea GRAVIER. All rights reserved



import Foundation
import SpriteKit
import GameplayKit
import UIKit

let screenHeight = UIScreen.main.bounds.maxY

var orangeColor = UIColor(red: 0.7, green: 1.0, blue: 0.2, alpha: 0.75)
var purpleColor = UIColor(red: 0.6, green: 0.4, blue: 0.8, alpha: 0.75)
struct physicsCategory {
    static let player: UInt32 = 0
    static let projectile: UInt32 = 1
    static let enemy: UInt32 = 2
    //static let problemAnswer: UInt32 = 3
}


class GameScene: SKScene, SKPhysicsContactDelegate, ObservableObject {
    var counter = 0
    var playerScore = 1
    @Published var gameMode = "maths"
    @Published var gameIsOver: Bool = false
    @Published var bestScore = 0
    @Published var isAlive = true
    @Published var score = 0
    @Published var difficulty = "easy"
    
    override func didMove(to view: SKView) {
        bestScore = Spacematic.select()!
        projectileSpeed = 1
        enemySpeed = 3.6
        nodesSpawnRate = 7
        nodesSpeed = 6.6
        fireProjectileRate = 0.4
        enemySpawnRate = 1
        
        if difficulty == "easy" {
            playerScore = 1
            
            //fireProjectileRate = 0.3
            
            //projectileSpeed = 1
            
            //enemySpeed = 3.5
            //enemySpawnRate = 0.4
            //starSpeed = 1.3
            
            //nodesSpeed = 3.4
            //nodesSpawnRate = 4.4
            
        } else if difficulty == "medium" {
            playerScore = 3
            
            //fireProjectileRate = 0.35
            
            //projectileSpeed = 1
            
            //enemySpeed = 3.6
            //enemySpawnRate = 0.35
            //starSpeed = 1.1
            
            //nodesSpeed = 3.5
            //nodesSpawnRate = 4.5
        } else if difficulty == "hard" {
            playerScore = 5
            
            //fireProjectileRate = 0.4
            
            //projectileSpeed = 1
            
            //enemySpeed = 3.7
            //enemySpawnRate = 0.3
            //starSpeed = 0.9
            
            //nodesSpeed = 3.6
            //nodesSpawnRate = 4.6
        }
        backgroundColor = offBlackColor
        physicsWorld.contactDelegate = self
        
        
        resetGame()
        
        spawnMainLabel()
        spawnPlayer()
        
        
        spawnNodes()
        
        fireProjectile()
        
        timerSpawnEnemies()
        timerSpawnStars()
        timerSpawnNodes()
        
        
        
    }
    
    
    func spawnNodes() {
        
        let mathProblem = generateProblem(difficulty: difficulty, score: score)
        
        
        func shuffleAnswers(problem: (String, Int, Int)) -> [String] {
            let possibilities = ["+", "-"]
            var sign = possibilities.randomElement()!
            var falseAnswer = 0
            var answers: [String] = []
            
            if problem.2 == 1 {
                sign = possibilities.randomElement()!

                switch sign {
                    
                case "+":
                    
                    falseAnswer = problem.1 + Int.random(in:1...9)
                case "-":
                    falseAnswer = problem.1 - Int.random(in:1...9)
                default:
                    break
                }
                
                
                answers.append(String(falseAnswer))
                
            } else if problem.2 == 3 {
                
                sign = possibilities.randomElement()!
                
                switch sign {
                case "+":
                    var a = Int.random(in: 1...6)
                    var b = Int.random(in: 1...6)
                    while(a==b) {
                        b = Int.random(in:1...6)
                    }
                    falseAnswer = problem.1 + a
                    answers.append(String(falseAnswer))
                    sign = possibilities.randomElement()!
                    switch sign {
                    case "+":
                        falseAnswer = problem.1 + b
                        answers.append(String(falseAnswer))
                    case "-":
                        falseAnswer = problem.1 - Int.random(in:1...6)
                        answers.append(String(falseAnswer))
                    default:
                        break
                    }
                case "-":var a = Int.random(in: 1...6)
                    var b = Int.random(in: 1...6)
                    while(a==b) {
                        b = Int.random(in:1...6)
                    }
                    falseAnswer = problem.1 - a
                    answers.append(String(falseAnswer))
                    sign = possibilities.randomElement()!
                    switch sign {
                    case "+":
                        falseAnswer = problem.1 + Int.random(in:1...6)
                        answers.append(String(falseAnswer))
                    case "-":
                        falseAnswer = problem.1 - b
                        answers.append(String(falseAnswer))
                    default:
                        break
                    }
                    
                default:
                    break
                }
                
                
                
                
            } else if problem.2 == 5 {
                switch sign {
                case "+":
                    var a = Int.random(in: 1...4)
                    var b = Int.random(in: 1...4)
                    while(a==b) {
                        b = Int.random(in:1...4)
                    }
                    falseAnswer = problem.1 + a
                    answers.append(String(falseAnswer))
                    sign = possibilities.randomElement()!
                    switch sign {
                    case "+":
                        falseAnswer = problem.1 + b
                        answers.append(String(falseAnswer))
                    case "-":
                        falseAnswer = problem.1 - Int.random(in:1...4)
                        answers.append(String(falseAnswer))
                    default:
                        break
                    }
                case "-":var a = Int.random(in: 1...4)
                    var b = Int.random(in: 1...4)
                    while(a==b) {
                        b = Int.random(in:1...4)
                    }
                    falseAnswer = problem.1 - a
                    answers.append(String(falseAnswer))
                    sign = possibilities.randomElement()!
                    switch sign {
                    case "+":
                        falseAnswer = problem.1 + Int.random(in:1...4)
                        answers.append(String(falseAnswer))
                    case "-":
                        falseAnswer = problem.1 - b
                        answers.append(String(falseAnswer))
                    default:
                        break
                    }
                    
                default:
                    break
                }
                
                
            }
            answers.append(String(problem.1))
            answers.shuffle()
            return answers
        }
        
        func spawnProblem() {
            
            problem = SKShapeNode(rectOf: CGSize(width: (CGRectGetMaxX(self.frame) - 150), height: 50), cornerRadius: 15)
            
            problem.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGFloat(nodesY + 100))
            problem.zPosition = 4
            problem.fillColor = purpleColor
            problem.strokeColor = purpleColor
            problem.glowWidth = 0.0
            
            //moveNodesToFloor(node: circle1)
            addChild(problem)
            
            func spawnProblemLabel() {
                textProblem = SKLabelNode(fontNamed: "Futura")
                textProblem.fontSize = 30
                textProblem.zPosition = 6
                textProblem.fontColor = offWhiteColor
                textProblem.position = CGPoint(x: problem.position.x, y: problem.position.y - 10)
                textProblem.text = mathProblem.0
                
                //moveNodesToFloor(node: labelMain1)
                addChild(textProblem)
            }
            
            spawnProblemLabel()
        }
        
        var answers: [String] = []
        if difficulty == "easy" {
            answers = shuffleAnswers(problem: mathProblem)
            
            func spawnCircle1() {
                //circle1 = SKShapeNode(rectOf: CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/2 - 100), height: 100), cornerRadius: 15)
                circle1 = SKSpriteNode(color: orangeColor, size: CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/2 - 100), height: 100))
                circle1.size = CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/2 - 100), height: 100)
                circle1.position = CGPoint(x: (CGFloat(CGRectGetMinX(self.frame)) + (((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/2) / 2 + 30 )), y: CGFloat(nodesY))
                //circle1.position = CGPoint(x: CGFloat(40), y: CGFloat(nodesY))
                circle1.zPosition = 4
                /*circle1.fillColor = orangeColor
                 circle1.strokeColor = orangeColor
                 circle1.glowWidth = 0.0*/
                
                if mathProblem.1 != Int(answers[0]) {
                    
                    circle1.physicsBody = SKPhysicsBody(rectangleOf: circle1.size)
                    circle1.physicsBody!.affectedByGravity = false
                    circle1.physicsBody!.categoryBitMask = physicsCategory.enemy
                    //circle1.physicsBody!.contactTestBitMask = physicsCategory.player
                    circle1.physicsBody!.collisionBitMask = physicsCategory.player
                    circle1.physicsBody!.allowsRotation = false
                    circle1.physicsBody!.isDynamic = true
                    
                    
                    circle1.name = "wrongAnswer"
                }
                //moveNodesToFloor(node: circle1)
                addChild(circle1)
                
                func spawnLabel1() {
                    labelMain1 = SKLabelNode(fontNamed: "Futura")
                    labelMain1.fontSize = 40
                    labelMain1.fontColor = offWhiteColor
                    labelMain1.zPosition = 6
                    labelMain1.position = CGPoint(x: circle1.position.x, y: circle1.position.y - 15)
                    labelMain1.text = answers[0]
                    
                    //moveNodesToFloor(node: labelMain1)
                    addChild(labelMain1)
                }
                
                
                spawnLabel1()
            }
            
            
            func spawnCircle2() {
                //circle2 = SKShapeNode(rectOf: CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/2 - 100), height: 100), cornerRadius: 15)
                circle2 = SKSpriteNode(color: orangeColor, size: CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/2 - 100), height: 100))
                circle2.size = CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/2 - 100), height: 100)
                circle2.position = CGPoint(x: (CGFloat(CGRectGetMaxX(self.frame)) - (((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/2) / 2 + 30)), y: CGFloat(nodesY))
                circle2.zPosition = 4
                /*circle2.fillColor = orangeColor
                 circle2.strokeColor = orangeColor
                 circle2.glowWidth = 0.0*/
                
                //moveNodesToFloor(node: circle2)
                
                if mathProblem.1 != Int(answers[1]) {
                    circle2.physicsBody = SKPhysicsBody(rectangleOf: circle2.size)
                    circle2.physicsBody!.affectedByGravity = false
                    circle2.physicsBody!.categoryBitMask = physicsCategory.enemy
                    circle2.physicsBody!.collisionBitMask = physicsCategory.player
                    //circle2.physicsBody!.contactTestBitMask = physicsCategory.player
                    
                    circle2.physicsBody!.allowsRotation = false
                    circle2.physicsBody!.isDynamic = true
                    
                    
                    circle2.name = "wrongAnswer"
                }
                
                addChild(circle2)
                
                func spawnLabel2() {
                    labelMain2 = SKLabelNode(fontNamed: "Futura")
                    labelMain2.fontSize = 40
                    labelMain2.fontColor = offWhiteColor
                    labelMain2.zPosition = 6
                    labelMain2.position = CGPoint(x: circle2.position.x, y: circle2.position.y - 15)
                    labelMain2.text = answers[1]
                    
                    
                    
                    //moveNodesToFloor(node: labelMain2)
                    addChild(labelMain2)
                }
                
                
                spawnLabel2()
            }
            
            spawnCircle2()
            spawnCircle1()
            spawnProblem()
            totalNodes = [problem, textProblem, circle1, labelMain1, circle2, labelMain2]
            moveNodesToFloor(nodes: totalNodes)
            //moveNodesToFloor()
            
            
            
        } else if difficulty == "medium" || difficulty == "hard" {
            answers = shuffleAnswers(problem: mathProblem)
            
            func spawnCircle1() {
                //circle1 = SKShapeNode(rectOf: CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/3 - 60), height: 100), cornerRadius: 15)
                circle1 = SKSpriteNode(color: orangeColor, size: CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/3 - 60), height: 100))
                circle1.size = CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/3 - 60), height: 100)
                circle1.position = CGPoint(x: (CGFloat(CGRectGetMinX(self.frame)) + (((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/3) / 2 + 40 )), y: CGFloat(nodesY))
                circle1.zPosition = 4
                /*circle1.fillColor = orangeColor
                 circle1.strokeColor = orangeColor
                 circle1.glowWidth = 0.0*/
                
                
                if mathProblem.1 != Int(answers[0]) {
                    circle1.physicsBody = SKPhysicsBody(rectangleOf: circle1.size)
                    circle1.physicsBody!.affectedByGravity = false
                    circle1.physicsBody!.categoryBitMask = physicsCategory.enemy
                    //circle1.physicsBody!.contactTestBitMask = physicsCategory.player
                    circle1.physicsBody!.collisionBitMask = physicsCategory.player
                    circle1.physicsBody!.allowsRotation = false
                    circle1.physicsBody!.isDynamic = true
                    
                    
                    circle1.name = "wrongAnswer"
                }
                
                addChild(circle1)
                
                func spawnLabel1() {
                    labelMain1 = SKLabelNode(fontNamed: "Futura")
                    labelMain1.fontSize = 40
                    labelMain1.zPosition = 6
                    labelMain1.fontColor = offWhiteColor
                    labelMain1.position = CGPoint(x: circle1.position.x, y: circle1.position.y - 15)
                    labelMain1.text = answers[0]
                    
                    
                    addChild(labelMain1)
                }
                
                
                spawnLabel1()
            }
            
            
            func spawnCircle2() {
                //circle2 = SKShapeNode(rectOf: CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/3 - 60), height: 100), cornerRadius: 15)
                circle2 = SKSpriteNode(color: orangeColor, size: CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/3 - 60), height: 100))
                circle2.size = CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/3 - 60), height: 100)
                circle2.position = CGPoint(x: CGFloat(CGRectGetMidX(self.frame)), y: CGFloat(nodesY))
                circle2.zPosition = 4
                /*circle2.fillColor = orangeColor
                 circle2.strokeColor = orangeColor
                 circle2.glowWidth = 0.0*/
                
                if mathProblem.1 != Int(answers[1]) {
                    circle2.physicsBody = SKPhysicsBody(rectangleOf: circle2.size)
                    circle2.physicsBody!.affectedByGravity = false
                    circle2.physicsBody!.categoryBitMask = physicsCategory.enemy
                    circle2.physicsBody!.collisionBitMask = physicsCategory.player
                    //circle2.physicsBody!.contactTestBitMask = physicsCategory.player
                    
                    circle2.physicsBody!.allowsRotation = false
                    circle2.physicsBody!.isDynamic = true
                    
                    
                    circle2.name = "wrongAnswer"
                }
                
                addChild(circle2)
                
                func spawnLabel2() {
                    labelMain2 = SKLabelNode(fontNamed: "Futura")
                    labelMain2.fontSize = 40
                    labelMain2.fontColor = offWhiteColor
                    labelMain2.zPosition = 6
                    labelMain2.position = CGPoint(x: circle2.position.x, y: circle2.position.y - 15)
                    labelMain2.text = answers[1]
                    
                    
                    addChild(labelMain2)
                }
                
                
                spawnLabel2()
            }
            
            
            func spawnCircle3() {
                //circle3 = SKShapeNode(rectOf: CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/3 - 60), height: 100), cornerRadius: 15)
                circle3 = SKSpriteNode(color: orangeColor, size: CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/3 - 60), height: 100))
                circle3.size = CGSize(width: ((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/3 - 60), height: 100)
                circle3.position = CGPoint(x: (CGFloat(CGRectGetMaxX(self.frame)) - (((CGRectGetMaxX(self.frame) - CGRectGetMinX(self.frame))/3) / 2 + 40)), y: CGFloat(nodesY))
                circle3.zPosition = 4
                //circle3.fillColor = orangeColor
                //circle3.strokeColor = orangeColor
                //circle3.glowWidth = 0.0
                
                if mathProblem.1 != Int(answers[2]) {
                    circle3.physicsBody = SKPhysicsBody(rectangleOf: circle3.size)
                    circle3.physicsBody!.affectedByGravity = false
                    circle3.physicsBody!.categoryBitMask = physicsCategory.enemy
                    circle3.physicsBody!.collisionBitMask = physicsCategory.player
                    //circle3.physicsBody!.contactTestBitMask = physicsCategory.player
                    circle3.physicsBody!.allowsRotation = false
                    circle3.physicsBody!.isDynamic = true
                    
                    
                    circle3.name = "wrongAnswer"
                }
                
                
                addChild(circle3)
                
                func spawnLabel3() {
                    labelMain3 = SKLabelNode(fontNamed: "Futura")
                    labelMain3.fontSize = 40
                    labelMain3.fontColor = offWhiteColor
                    labelMain3.zPosition = 6
                    labelMain3.position = CGPoint(x: circle3.position.x, y: circle3.position.y - 15)
                    labelMain3.text = answers[2]
                    
                    
                    addChild(labelMain3)
                }
                
                
                spawnLabel3()
            }
            
            spawnCircle3()
            spawnCircle2()
            spawnCircle1()
            spawnProblem()
            totalNodes = [problem, textProblem, circle1, labelMain1, circle2, labelMain2, circle3, labelMain3]
            moveNodesToFloor(nodes: totalNodes)
            
        }
        
    }
    
    func deleteNodes() {
        
        circle1.removeFromParent()
        labelMain1.removeFromParent()
        circle2.removeFromParent()
        labelMain2.removeFromParent()
        if difficulty == "medium" || difficulty == "hard" {
            
            circle3.removeFromParent()
            labelMain3.removeFromParent()
        }
    }
    
    func moveNodesToFloor(nodes: [SKNode]) {
        
        for node in nodes {
            let moveTo = SKAction.moveTo(y: node.position.y - 1150, duration: nodesSpeed)
            let destroy = SKAction.removeFromParent()
            
            node.run(SKAction.sequence([moveTo, destroy]))
        }
    }
    
    
    func timerSpawnNodes() {
        let wait = SKAction.wait(forDuration: nodesSpawnRate)
        
        let spawn = SKAction.run {
            
            if self.isAlive == true {
                self.spawnNodes()
            }
            
        }
        let sequence = SKAction.sequence([wait, spawn])
        run(SKAction.repeatForever(sequence))
    }
    
    
    
    
    
    func spawnPlayer() {
        player = SKSpriteNode(imageNamed: "Untitled-Artwork")
        player.size = playerSize
        
        player.position = CGPoint(x: CGRectGetMidX(self.frame), y: 150)
        player.zPosition = CGFloat(10)
        
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody!.affectedByGravity = false
        player.physicsBody!.categoryBitMask = physicsCategory.player
        player.physicsBody!.collisionBitMask = physicsCategory.enemy // Collide with enemy
        player.physicsBody!.contactTestBitMask = physicsCategory.enemy // Test contact with enemy
        player.physicsBody!.isDynamic = true
        
        
        
        player.name = "playerName"
        
        addChild(player)
    }
    
    func spawnProjectile() {
        projectile = SKSpriteNode(color: offWhiteColor, size: projectileSize)
        projectile.size = projectileSize
        projectile.position = CGPoint(x: (player.position.x), y: player.position.y)
        projectile.zPosition = CGFloat(5)
        
        projectile.physicsBody = SKPhysicsBody(rectangleOf: projectile.size)
        projectile.physicsBody!.affectedByGravity = false
        projectile.physicsBody!.categoryBitMask = physicsCategory.projectile
        projectile.physicsBody!.collisionBitMask = physicsCategory.enemy // Collide with enemy
        projectile.physicsBody!.contactTestBitMask = physicsCategory.enemy // Test contact with enemy
        projectile.physicsBody!.isDynamic = true
        
        projectile.name = "projectileName"
        projectile.zPosition = -1
        
        moveProjectileToTop()
        
        addChild(projectile)
    }
    
    func moveProjectileToTop() {
        let moveForward = SKAction.moveTo(y: 1000, duration: projectileSpeed)
        let destroy = SKAction.removeFromParent()
        
        //let sequence = SKAction.sequence([moveForward, destroy])
        projectile.run(SKAction.sequence([moveForward, destroy]))
        
    }
    
    func spawnEnemy() {
        let randomX = CGFloat.random(in: (CGRectGetMinX(self.frame) + 100)...(CGRectGetMaxX(self.frame)-100))
        
        let name = ["Untitled-Artwork-1","Untitled-Artwork-2"]
        
        enemy = SKSpriteNode(imageNamed: name[Int.random(in: 0...1)])
        let randomSize1 = Int.random(in: 55...85)
        let randomSize2 = Int.random(in: 55...85)
        
        enemy.size = CGSize(width: randomSize1, height: randomSize2)
        
        
        enemy.position = CGPoint(x: randomX, y: screenHeight)
        enemy.zPosition = CGFloat(5)
        
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
        enemy.physicsBody!.affectedByGravity = false
        enemy.physicsBody!.categoryBitMask = physicsCategory.enemy
        enemy.physicsBody!.collisionBitMask = physicsCategory.player | physicsCategory.projectile // Collide with player and projectile
        enemy.physicsBody!.contactTestBitMask = physicsCategory.player | physicsCategory.projectile // Test contact with player and projectile
        enemy.physicsBody!.isDynamic = true
        
        enemy.name = "enemyName"
        
        moveEnemyToFloor()
        
        addChild(enemy)
    }
    
    func moveEnemyToFloor() {
        let moveTo = SKAction.moveTo(y: -150, duration: enemySpeed)
        let destroy = SKAction.removeFromParent()
        
        enemy.run(SKAction.sequence([moveTo, destroy]))
    }
    
    func spawnStar() {
        let randomSize = Int.random(in: 2...4)
        let randomX = CGFloat.random(in: (CGRectGetMinX(self.frame) + 5)...(CGRectGetMaxX(self.frame) - 5))
        starSize = CGSize(width: randomSize, height: randomSize)
        
        star = SKSpriteNode(color: offWhiteColor, size: starSize)
        star.size = starSize
        star.position = CGPoint(x: randomX, y: 1000)
        star.zPosition = -1
        
        starsMove()
        addChild(star)
    }
    
    func starsMove() {
        let randomTime = Int.random(in: 0...10)
        let doubleRandomTime: Double = Double(randomTime)/10 + 2
        let moveTo = SKAction.moveTo(y: -100, duration: doubleRandomTime)
        
        let destroy = SKAction.removeFromParent()
        
        star.run(SKAction.sequence([moveTo, destroy]))
    }
    
    func spawnMainLabel() {
        
        mainLabel = SKLabelNode(fontNamed: "Futura")
        mainLabel.fontSize = 60
        mainLabel.fontColor = offWhiteColor
        mainLabel.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame) + 200)
        mainLabel.zPosition = 0
        mainLabel.text = "Score : \(score)"
        
        addChild(mainLabel)
    }
    
    
    func fireProjectile() {
        let timer = SKAction.wait(forDuration: fireProjectileRate)
        
        
        let spawn = SKAction.run {
            if self.isAlive == true {
                self.spawnProjectile()
            }
        }
        
        let sequence = SKAction.sequence([timer, spawn])
        self.run(SKAction.repeatForever(sequence))
    }
    
    func timerSpawnEnemies() {
        let wait = SKAction.wait(forDuration: enemySpawnRate)
        
        let spawn = SKAction.run {
            if self.isAlive == true {
                self.spawnEnemy()
            }
            
        }
        let sequence = SKAction.sequence([wait, spawn])
        run(SKAction.repeatForever(sequence))
    }
    
    func timerSpawnStars() {
        let wait = SKAction.wait(forDuration: 0.1)
        
        let spawn = SKAction.run {
            if self.isAlive {
                self.spawnStar()
                
                
            }
        }
        let sequence = SKAction.sequence([wait, spawn])
        
        self.run(SKAction.repeatForever(sequence))
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        //print("contact")
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
        
        if ((firstBody.contactTestBitMask == physicsCategory.projectile) && (secondBody.categoryBitMask == physicsCategory.projectile) || (firstBody.categoryBitMask == physicsCategory.projectile) && (secondBody.contactTestBitMask == physicsCategory.projectile)) {
            
            spawnExplosion(enemyTemp: firstBody.node as! SKSpriteNode)
            enemyProjectileCollision(contactA: firstBody.node as! SKSpriteNode, contactB: secondBody.node as! SKSpriteNode)
        }
        else if ((firstBody.categoryBitMask == physicsCategory.player) && (secondBody.collisionBitMask == physicsCategory.player) && (secondBody.categoryBitMask == physicsCategory.enemy) || (firstBody.collisionBitMask == physicsCategory.player) && (firstBody.categoryBitMask == physicsCategory.enemy)  && (secondBody.categoryBitMask == physicsCategory.player)) {
            //print("contaezzfct")
            
            playerEnemyCollision(contactA: firstBody.node as! SKSpriteNode, contactB: secondBody.node as! SKSpriteNode)
        }
        
        else if ((firstBody.categoryBitMask == physicsCategory.enemy) && (secondBody.categoryBitMask == physicsCategory.player) || (firstBody.categoryBitMask == physicsCategory.player) && (secondBody.categoryBitMask == physicsCategory.enemy)) {
            
            playerEnemyCollision(contactA: firstBody.node as! SKSpriteNode, contactB: secondBody.node as! SKSpriteNode)
        }
        
        /*if ((firstBody.categoryBitMask == physicsCategory.enemy) && (secondBody.categoryBitMask == physicsCategory.player) || (firstBody.categoryBitMask == physicsCategory.player) && (secondBody.categoryBitMask == physicsCategory.enemy)) {
         print("hyuzgerd")
         playerAnswerCollision(contactA: firstBody.node as! SKSpriteNode, contactB: secondBody.node as! SKSpriteNode)
         }*/
        
    }
    
    
    func enemyProjectileCollision(contactA: SKSpriteNode, contactB : SKSpriteNode) {
        if contactA.name == "enemyName" && contactB.name == "projectileName" {
            //score += 1
            
            //let fadeOut = SKAction.fadeOut(withDuration: 0.2)
            let destroy = SKAction.removeFromParent()
            
            contactA.run(SKAction.sequence([destroy]))
            
            contactB.removeFromParent()
            
            score += playerScore
            updateScore()
            
            
        }
        
        if contactB.name == "enemyName" && contactA.name == "projectileName" {
            //score += 1
            
            //let fadeOut = SKAction.fadeOut(withDuration: 0.2)
            let destroy = SKAction.removeFromParent()
            
            contactB.run(SKAction.sequence([destroy]))
            
            contactA.removeFromParent()
            
            score += playerScore
            updateScore()
            
        }
    }
    
    func playerEnemyCollision(contactA: SKSpriteNode, contactB : SKSpriteNode) {
        /*if contactA.name == "enemyName" && contactB.name == "playerName" {
         isAlive = false
         gameOverLogic()
         }
         
         if contactB.name == "enemyName" && contactA.name == "playerName" {
         isAlive = false
         gameOverLogic()
         }*/
        isAlive = false
        gameOverLogic()
    }
    
    func spawnExplosion(enemyTemp: SKSpriteNode) {
        let explosionEmmitterPath = Bundle.main.path(forResource: "MyParticle", ofType: "sks")
        let explosion = NSKeyedUnarchiver.unarchiveObject(withFile: (explosionEmmitterPath!) as String) as! SKEmitterNode
        
        explosion.position = CGPoint(x: enemyTemp.position.x, y: enemyTemp.position.y)
        explosion.zPosition = 3
        explosion.targetNode = self
        
        self.addChild(explosion)
        
        let wait = SKAction.wait(forDuration: 2)
        let remove = SKAction.run {
            explosion.removeFromParent()
        }
        
        self.run(SKAction.sequence([wait, remove]))
        
        
    }
    
    func gameOverLogic() {
        
        //mainLabel.fontSize = 60
        //mainLabel.text = "Game Over"
        if score > bestScore {
            bestScore = score
            /*addDataBestScore(dbQueue: dbQueue, bestScore: bestScore)
             let newBestScore = bestScore
             bestScore = retrieveBestScore(bestScore: newBestScore)*/
            Spacematic.update(score: Int32(bestScore))
            bestScore = Spacematic.select()!
        }
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            self.removeAllChildren()
            self.gameIsOver = true
            print("finished")
            
            
        }
        
    }
    
    
    func resetGame() {
        mainLabel.removeFromParent()
        //scoreLabel.removeFromParent()
        
        
        player.removeFromParent()
        deleteNodes()
        isAlive = true
        
    }
    
    func updateScore() {
        mainLabel.text = "Score : \(score)"
    }
    
    func movePLayerOffScreen() {
        player.position.x = -300
        removeFromParent()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            touchLocation = touch.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            touchLocation = touch.location(in: self)
            if isAlive {
                movePlayerOnTouch()
            }
            
        }
    }
    
    func movePlayerOnTouch() {
        player.position.x = (touchLocation.x)
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        //didBeginContact(contact: SKPhysicsContact())
        
        // Called before each frame is rendered
        if !isAlive {
            movePLayerOffScreen()
        }
        /*if isAlive {
         updateScore()
         /*if self.score == 50 && difficulty == "easy" {
          enemySpeed -= 0.1
          enemySpawnRate -= 0.05
          starSpeed += 0.1
          
          nodesSpeed -= 0.15
          nodesSpawnRate -= 0.15
          }
          if self.score == 150 && difficulty == "medium" {
          enemySpeed -= 0.1
          enemySpawnRate -= 0.05
          starSpeed += 0.1
          
          nodesSpeed -= 0.15
          nodesSpawnRate -= 0.15
          }
          if self.score == 250 && difficulty == "hard" {
          enemySpeed -= 0.1
          enemySpawnRate -= 0.05
          starSpeed += 0.1
          
          nodesSpeed -= 0.15
          nodesSpawnRate -= 0.15
          }*/
         /*if counter >= 60 {
          score += playerScore
          counter = 0
          } else {
          counter += 1
          }*/
         }*/
        
    }
}

