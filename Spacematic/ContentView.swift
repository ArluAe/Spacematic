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
        UITabBar.appearance().backgroundColor = UIColor(red: 0.5, green: 0.4, blue: 0.65, alpha: 1.0)
    }
    var body: some View {
        ZStack {
            
            Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1.0)
                .ignoresSafeArea(.all)
            //TabView {
                GameMenuView()
                    /*.tabItem {
                        Image(systemName: "play")
                        Text("Play")
                    }
                    
                StatsView()
                    .tabItem {
                        Image(systemName: "mail.stack")
                        Image(systemName: "brain.head.profile")
                        Text("Stats")
                    }

            }
            .accentColor(Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1))*/
    }/*.onAppear {
        
        //BackgroundMusicManager.shared.setupAudioSession()
        BackgroundMusicManager.shared.startBackgroundMusic()
        }*/
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
