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
    

        @State private var score1 = 0
        @State private var score2 = 0

     
    
    
    
    //@State var realID1 = "ca-app-pub-3510970014586940/9557659032"
    //@State var realID2 = ""
    /*private let banner: GADBannerView = {
        let banner = GADBannerView()
        banner.adUnitID = "ca-app-pub-3510970014586940/3003257656"
        banner.load(GADRequest())
        return banner
    }()*/
    
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
    
    
    
    //@State var gameIsOver = false
    
    @State var gameOverTextY = -300
    
    //@State var score = 0
    //@State var bestScore = 0
    @State var difficulty = "easy"
    
    @State var backColorD1: Color = Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1)
    @State var backColorD2: Color = .clear
    @State var backColorD3: Color = .clear
    
    @State var backColorM1: Color = Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1)
    @State var backColorM2: Color = .clear
    

    var body: some View {
        //VStack {
            ZStack {
                Color(red: 0.35, green: 0.25, blue: 0.45, opacity: 1.0)
                    .ignoresSafeArea(.all)
                
                if gameIsInProgress {
                    VStack {
                        

                        //SpriteView(scene: scene, debugOptions : [.showsFPS,.showsNodeCount])
                        SpriteView(scene: scene)
                            .frame(width: 560, height: 830-120)
                            .ignoresSafeArea()
                        /*VStack {
                         Spacer(minLength: 500)
                         GADBannerViewController(realID: $realID2)
                         }*/
                    }
                    
                } else if !gameIsInProgress && !scene.gameIsOver  {
                    ZStack {
                        
                        HStack {
                            
                            //GADBannerViewController(realID: $realID1)
                            //.frame(alignment: .center)
                            
                            
                        }
                        
                        VStack {
                            
                            
                            
                            Spacer()
                            //GADBannerViewController()
                            Text("Spacematic")
                                .font(.custom("Arial", size: 40))
                                .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                                .fontWeight(.bold)
                                .padding()
                                .scaleEffect(isScaled ? 1.0 : 1.1)
                                        // Animate the scale effect with a duration and repeat it forever with an autoreverse
                                .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isScaled)
                                        // Trigger the animation when the view appears
                                .onAppear {
                                            isScaled = true
                                }
                            //.font(Futura)
                            Spacer()
                            Button {
                                if backColorD1 == Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1) {
                                    scene.difficulty = "easy"
                                    
                                    
                                    
                                } else if backColorD2 == Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1) {
                                    scene.difficulty = "medium"
                                } else if backColorD3 == Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1) {
                                    scene.difficulty = "hard"
                                }
                                if backColorM1 == Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1) {
                                    scene.gameMode = "maths"
                                } else if backColorM2 == Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1) {
                                    scene.gameMode = "geography"
                                }
                                gameOverTextY = -1000
                                //gameIsInProgress = true
                                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                                    
                                    
                                    gameIsInProgress = true
                                }
                                
                                
                            } label: {
                                
                                Image(systemName: "play.circle")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                                    //.padding()
                                // Apply the scale effect based on the isScaled state variable
                                    .scaleEffect(isScaled ? 1.1 : 1.0)
                                            // Animate the scale effect with a duration and repeat it forever with an autoreverse
                                    .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isScaled)
                                            // Trigger the animation when the view appears
                                    .onAppear {
                                                isScaled = true
                                    }
                            }
                            //Text(generateProblem(difficulty: "hard").0)

                            VStack {
                                DifficultyBarView(backColorD1: $backColorD1, backColorD2: $backColorD2, backColorD3: $backColorD3)
                                
                                GameModeBarView(backColorM1: $backColorM1, backColorM2: $backColorM2)
                            }.padding(50)
                            Spacer(minLength: 100)

                            
                        }
                        /*VStack {
                            Spacer()
                            
                            
                            HStack {
                                
                                Button {
                                    showingSheet.toggle()
                                } label: {
                                    ZStack {
                                        Image(systemName: "circle.fill")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                                            .padding()
                                        Image(systemName: "book.circle.fill")
                                            .resizable()
                                            .frame(width: 70, height: 70)
                                            .foregroundColor(.purple)
                                            .padding()
                                    }
                                }
                                .sheet(isPresented: $showingSheet) {
                                    bookView(showingSheet: $showingSheet)
                                }
                            }.padding()
                                
                            
                            //GADBannerViewController(realID: $realID1)
                            /*HStack {
                             Spacer()
                             Button {
                             showingSheet.toggle()
                             } label: {
                             ZStack {
                             Image(systemName: "circle.fill")
                             .resizable()
                             .frame(width: 80, height: 80)
                             .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                             .padding()
                             Image(systemName: "cart.circle.fill")
                             .resizable()
                             .frame(width: 70, height: 70)
                             .foregroundColor(.purple)
                             .padding()
                             }
                             }
                             .sheet(isPresented: $showingSheet) {
                             shopView(showingSheet: $showingSheet)
                             }
                             
                             }BETA*/
                            
                        }*/
                        VStack {
                        
                            Spacer()
                            
                            Button {
                                showingSheet.toggle()
                            } label: {
                                ZStack {
                                    Image(systemName: "circle.fill")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                                        .padding()
                                    Image(systemName: "book.circle.fill")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(.purple)
                                        .padding()
                                }
                                .padding()
                            }
                            .sheet(isPresented: $showingSheet) {
                                bookView(showingSheet: $showingSheet)
                            }}.padding(15)
                    } .frame(width: 560, height: 830-120)
                }
                if gameIsInProgress && scene.gameIsOver {
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height: 400)
                            .foregroundColor(Color(red: 1.0, green: 0.2, blue: 0.2, opacity: 0.7))
                            .cornerRadius(20)
                        //.position(x: 200, y: CGFloat(gameOverTextY))
                        
                        VStack {
                            Text("Game Over")
                                
                                .font(.custom("Arial", size: 30)).fontWeight(.bold)
                                
                            /*.onAppear() {
                             textGameOverMove()
                             }*/
                            
                                .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                                .padding()
                            Text("Score : " + String(scene.score))
                                .font(.custom("Arial", size: 30)).fontWeight(.bold).foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                            Text("Best : \(String(select(gameMode: scene.gameMode)!))")
                                .font(.custom("Arial", size: 30))
                                .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                                .fontWeight(.bold)
                                .padding()
                            Button {
                                
                                    
                                    gameIsInProgress = false
                                    scene.gameIsOver = false
                                    isScaled = false
                                    
                                    scene.score = 0
                                    
                                    //restart game bugs
                                
                            } label :{
                                Image(systemName: "arrow.counterclockwise.circle")
                                    .resizable()
                                    .frame(width: 90, height: 90)
                                    .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                                    .padding()
                                    .scaleEffect(isScaled ? 1.0 : 1.1)
                                            // Animate the scale effect with a duration and repeat it forever with an autoreverse
                                    .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isScaled)
                                            // Trigger the animation when the view appears
                                    .onAppear {
                                        isScaled = false
                                    }
                            }
                               
                            /*Text("Restart")
                             .fontWeight(.bold)
                             /*.onAppear() {
                              textGameOverMove()
                              }*/
                             
                             .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                             .onTapGesture {
                             scene.gameIsOver = false
                             
                             restart = true
                             SpriteView(scene: scene)
                             .frame(width: 560, height: 830)
                             .ignoresSafeArea()
                             }BETA*/
                            
                            
                            //.position(x: 200, y: CGFloat(gameOverTextY))
                        }
                        
                    }
                    .opacity(isVisible ? 1 : 0) // Start invisible, fade in to full opacity
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isVisible = true
                        }
                    }
                    
                }
            }
            //AdView()
            //.border(.green)
        /*VStack {
            /*GoogleAdView(adUnitID: "ca-app-pub-3940256099942544/2934735716")
                .frame(width: 320, height: 50)
                .padding(10)*/
            Spacer()
        }*/
        }
    
    func textGameOverMove() {
        withAnimation{
            gameOverTextY = 500
        }
    }
    
}

struct shopView: View {
    @Binding var showingSheet: Bool
    var body: some View {
        ZStack {
            Color(red: 0.4, green: 0.3, blue: 0.5, opacity: 1.0)
                .ignoresSafeArea(.all)
            VStack {
                Button {
                    showingSheet = false
                } label: {
                    Text("Done")
                        .font(.custom("Arial", size: 20))
                        .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                        .fontWeight(.bold)
                        .padding()
                }
                .padding()
                Spacer()
                ScrollView {
                    
                }
            }
        }
    }
}

struct bookView: View {
    @State private var showingSheet1 = false
    @Binding var showingSheet: Bool
    var body: some View {
        ZStack {
            Color(red: 0.4, green: 0.3, blue: 0.5, opacity: 1.0)
                .ignoresSafeArea(.all)
            VStack {
                Button {
                    showingSheet = false
                } label: {
                    Text("Done")
                        .font(.custom("Arial", size: 20))
                        .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                        .fontWeight(.bold)
                        .padding()
                }
                .padding()
                Spacer()
                ScrollView {
                    VStack {
                        
                        
                        let columns: [GridItem] = [
                            GridItem(.flexible(), spacing: 0),
                            GridItem(.flexible(), spacing: 0)
                        ]

                        LazyVGrid(columns: columns, alignment: .leading, spacing: 0) {
                            // Column Headers
                            Group {
                                Text("Game mode")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, alignment: .center)
                                    //.background(Color.gray.opacity(0.2))
                                    .border(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0), width: 2)
                                    .font(.custom("Arial", size: 20))
                                    .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0))
                                    .fontWeight(.bold)
                                
                                
                                Text("Best score")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, alignment: .center)
                                    //.background(Color.gray.opacity(0.2))
                                    .border(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0), width: 2)
                                    .font(.custom("Arial", size: 20))
                                    .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0))
                                    .fontWeight(.bold)
                                
                            }

                            // Data Rows
                            Group {
                                Text("Mental Maths")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, alignment: .center)
                                    //.background(Color.gray.opacity(0.2))
                                    .border(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0), width: 2)
                                    .font(.custom("Arial", size: 20))
                                    .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0))
                                    .fontWeight(.bold)
                                
                                Text(String(select(gameMode: "maths")!))
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, alignment: .center)
                                    //.background(Color.gray.opacity(0.2))
                                    .border(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0), width: 2)
                                    .font(.custom("Arial", size: 25))
                                    .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0))
                                    .fontWeight(.bold)
                            }

                            Group {
                                Text("Geography")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, alignment: .center)
                                    //.background(Color.gray.opacity(0.2))
                                    .border(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0), width: 2)
                                    .font(.custom("Arial", size: 20))
                                    .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0))
                                    .fontWeight(.bold)
                                
                                Text(String(select(gameMode: "geography")!))
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, alignment: .center)
                                    //.background(Color.gray.opacity(0.2))
                                    .border(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0), width: 2)
                                    .font(.custom("Arial", size: 25))
                                    .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0))
                                    .fontWeight(.bold)
                            }
                        
                    }.padding()
                            
                        
                        VStack {
                            Spacer()
                            
                            
                            Text("Made by : Charles-A. Gravier Morin")
                                .font(.custom("Arial", size: 15))
                                .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 0.8))
                                .fontWeight(.bold)
                                
                            
                            Text("Music : Thomas Mosen")
                                .font(.custom("Arial", size: 15))
                                .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 0.8))
                                .fontWeight(.bold)
                            Text("Copyright © 2024. Version 2.0.")
                                .font(.custom("Arial", size: 20))
                                .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0))
                                .fontWeight(.bold)
                                .padding(5)
                            
                        }
                        
                    }
                }
            }
        }
    }
}

/*struct GADBannerViewController: UIViewControllerRepresentable {
    @Binding var realID: String
    func makeUIViewController(context: Context) -> some UIViewController {
        let AdSize = GADAdSizeLargeBanner
        let view = GADBannerView(adSize: AdSize)
        let viewController = UIViewController()
        
        
        // Banner Ad
        let testID = "ca-app-pub-3940256099942544/2934735716"
        //let realID = "ca-app-pub-3510970014586940/3003257656"
        view.adUnitID = testID
        view.rootViewController = viewController
        
        // View Controller
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: AdSize.size)
        
        // Load an ad
        view.load(GADRequest())
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
      /*@State private var viewWidth: CGFloat = .zero
      private let bannerView = GADBannerView()
      private let adUnitID = "ca-app-pub-3940256099942544/2934735716"

      func makeUIViewController(context: Context) -> some UIViewController {
        let bannerViewController = BannerViewController()
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = bannerViewController
        bannerViewController.view.addSubview(bannerView)

        return bannerViewController
      }

      func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        guard viewWidth != .zero else { return }

        // Request a banner ad with the updated viewWidth.
        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
        bannerView.load(GADRequest())*/
    
}


struct GoogleAdView: UIViewRepresentable {
    let adUnitID: String
    let adSize = GADAdSizeFromCGSize(CGSize(width: 320, height: 50))
    
    func makeUIView(context: Context) -> GADBannerView {
        let bannerView = GADBannerView(adSize: adSize)
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = UIApplication.shared.windows.first?.rootViewController
        bannerView.load(GADRequest())
        return bannerView
    }
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {
        // Handle any updates, if needed
    }
}*/



struct GameMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GameMenuView()
    }
}
