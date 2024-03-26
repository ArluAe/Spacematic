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

    
    @State var gameIsInProgress = false
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
    
    @State var restart = false
    
    var body: some View {
        //VStack {
            ZStack {
                Color(red: 0.35, green: 0.25, blue: 0.45, opacity: 1.0)
                    .ignoresSafeArea(.all)
                
                if gameIsInProgress || restart {
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
                            Text("Best Score : \(String(select()!))")
                                .font(.custom("Arial", size: 45))
                                .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                                .fontWeight(.bold)
                                .padding()
                            //.font(Futura)
                            
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
                                gameIsInProgress = true
                                gameOverTextY = -1000
                            } label: {
                                Image(systemName: "play.circle")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                                    .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                                    .padding()
                            }
                            //Text(generateProblem(difficulty: "hard").0)
                            
                            
                            DifficultyBarView(backColorD1: $backColorD1, backColorD2: $backColorD2, backColorD3: $backColorD3).padding()
                            /*GameModeBarView(backColorM1: $backColorM1, backColorM2: $backColorM2).padding()BETA*/
                            Spacer(minLength: 50)
                            
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
                            Text("GAME OVER")
                                .fontWeight(.bold)
                            /*.onAppear() {
                             textGameOverMove()
                             }*/
                            
                                .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))
                            
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
                    .animation(.easeInOut, value: true)
                    .onTapGesture {
                        restart = false
                        gameIsInProgress = false
                        scene.gameIsOver = false
                        
                        scene.score = 0
                        
                        //restart game bugs
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
                    
                    Button {
                        showingSheet1.toggle()
                    } label: {
                    
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 50)
                                .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0))
                                .cornerRadius(30)
                            
                                
                            Rectangle()
                                .frame(width: 340, height: 40)
                                .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.5, opacity: 1.0))
                                .cornerRadius(30)
                          
                                
                            Text("Privacy Policy")
                                .font(.custom("Arial", size: 30))
                                .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0))
                                .fontWeight(.bold)
                        }
                    }
                    .sheet(isPresented: $showingSheet1) {
                        ZStack {
                            Color(red: 0.4, green: 0.3, blue: 0.5, opacity: 1.0)
                                .ignoresSafeArea(.all)
                            VStack {
                                Button {
                                    showingSheet1 = false
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
                                    
                                    Text("""
                                                    Privacy Policy for Spacematic

                                                    Last updated: March 7, 2024.

                                                    Welcome to Spacematic, a mental math game designed to challenge and improve your arithmetic skills. We take your privacy seriously and are committed to protecting it. This privacy policy outlines the types of information we may process when you use our Spacematic app, as well as the steps we take to protect and secure this information.

                                                    Information We Do Not Collect
                                                    Spacematic is designed to respect your privacy. As such, we do not collect or store any personal information from our users. Our app does not require users to provide personal data, such as names, email addresses, or other contact information, and we do not track or monitor users' activity for any purposes beyond the app's core functionality.

                                                    Local Storage of Data
                                                    The only data Spacematic stores is the best score achieved by the user, which is saved locally on the user's device through an SQLite database. This information is not backed up, shared, or accessible outside of the app. It is used solely to enhance the user experience by keeping track of the user's personal best score within the game.

                                                    No Third-Party Services
                                                    Spacematic does not use any third-party services that may collect information from our users. Our app operates independently, ensuring that users' gameplay and performance data remain private and are not shared externally.

                                                    Security
                                                    We are committed to ensuring that your information is secure. Since Spacematic stores very minimal data locally on your device, the risk of data breaches is significantly reduced. We encourage users to keep their devices and applications updated to further enhance security.

                                                    Changes to This Privacy Policy
                                                    We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.

                                                    Contact Us
                                                    As Spacematic does not collect contact information, we do not offer a direct line of communication for privacy concerns. However, we encourage users to review Apple's standard support channels for any concerns related to app privacy and security.
                                                    """).foregroundColor(.white)
                                                .padding()
                                            }
                            }
                        }
                    
                        
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 350, height: 50)
                            .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0))
                            .cornerRadius(30)
                        
                        
                        Rectangle()
                            .frame(width: 340, height: 40)
                            .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.5, opacity: 1.0))
                            .cornerRadius(30)
                          
                        Link("Terms of use", destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/")!)
                            .font(.custom("Arial", size: 30))
                            .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1.0))
                            .fontWeight(.bold)
                    
                    }
                        
                    
                    
                    
                    
                    Text("Copyright © 2024. Version 1.0.")
                        .font(.custom("Arial", size: 15))
                        .foregroundColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 0.8))
                        .fontWeight(.bold)
                        .padding()
                    
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
