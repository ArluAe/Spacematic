//
//  BackgroundMusicManager.swift
//  Spacematic
//
//  Created by Charles-An on 10/04/2024.
//
import UIKit
import AVFoundation

class BackgroundMusicManager: ObservableObject {
    static let shared = BackgroundMusicManager() // Singleton instance
    var audioPlayer: AVAudioPlayer?

    init() {
        setupAudioSession()
        setupNotifications()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error {
            print("Failed to set up audio session: \(error)")
        }
    }

    private func setupNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appDidBecomeActive),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appWillResignActive),
            name: UIApplication.willResignActiveNotification,
            object: nil
        )
    }

    @objc private func appDidBecomeActive() {
        startBackgroundMusic()
    }

    @objc private func appWillResignActive() {
        stopBackgroundMusic()
    }

    func startBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "sonpourcharles", withExtension: "wav") else {
            print("Unable to find the music file.")
            return
        }

        do {
            if audioPlayer == nil {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.numberOfLoops = -1 // Loop indefinitely
                audioPlayer?.rate = 1.3
                audioPlayer?.volume = 2.0
                audioPlayer?.enableRate = true
            }
            audioPlayer?.play()
        } catch let error {
            print("Failed to play music: \(error)")
        }
    }

    func adjustPlaybackSpeed(to rate: Float) {
        audioPlayer?.rate = rate
    }

    func stopBackgroundMusic() {
        audioPlayer?.stop()
    }
}
