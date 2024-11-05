# Spacematic App

Spacematic is a Swift-based educational game app where users can practice math and geography skills through engaging gameplay. The app dynamically generates math problems or geography questions and adjusts difficulty levels based on the user's score. The gameplay includes interactive elements such as a player-controlled spaceship, enemy objects, and animated backgrounds.

---

## Table of Contents

1. [Features](#features)
2. [Game Components](#game-components)
3. [Core Files](#core-files)
   - [ProblemGeneration.swift](#problemgenerationswift)
   - [GameScene.swift](#gamescenefswift)
   - [Components.swift](#componentsswift)
   - [ContentView.swift](#contentviewswift)
   - [SpacematicApp.swift](#spacematicappswift)
   - [BackgroundMusicManager.swift](#backgroundmusicmanagerswift)

---

## Features

- **Dynamic Problem Generation**: Math problems and geography questions adapt based on the user's selected difficulty and current score.
- **Difficulty Levels**: Easy, Medium, and Hard levels influence both problem complexity and enemy behavior.
- **Interactive Gameplay**: Players interact by touching and moving a spaceship, with continuous obstacles and challenges.
- **Background Music**: An audio background with adjustable playback rates enhances the game experience.

---

## Game Components

- **Player (Spaceship)**: The user controls a spaceship to dodge or interact with enemies and select answers.
- **Enemy Objects**: Represented as asteroids in the math game mode, or incorrect answers in the geography mode.
- **Math/Geography Problems**: Displayed on the screen with options to answer, allowing the player to score points.
- **Score and Best Score Tracking**: Tracks the player’s score during gameplay and saves the highest score in a local SQLite database.

---

## Core Files

### ProblemGeneration.swift

Handles the logic for dynamically generating math problems and geography questions. It uses parameters such as `difficulty` (easy, medium, hard), `score`, and `gameMode` (maths or geography) to create relevant questions:
- **Math Problems**: Depending on the difficulty, the generated math problems include addition, subtraction, and multiplication.
- **Geography Questions**: Capital city questions are based on lists of countries grouped by difficulty levels.

---

### GameScene.swift

Defines the main game scene and contains logic for various game components and behaviors:
- **Player**: Initializes the spaceship player with touch controls, including movement limitations within screen boundaries.
- **Enemy Objects**: Creates asteroids or incorrect answer options that the player must dodge or shoot.
- **Scoring System**: Updates and displays the player's score on screen, incrementing on correct answers.
- **Collision Detection**: Implements SKPhysicsContactDelegate to handle collisions between the player, enemies, and projectiles.

---

### Components.swift

Provides reusable components and UI elements used within the game:
- **DifficultyBarView**: SwiftUI view allowing the user to select difficulty level visually with color changes.
- **GameModeBarView**: SwiftUI view to switch between Math and Geography modes. Both views use `onTapGesture` to update selection states.

---

### ContentView.swift

The main UI for Spacematic. Initializes the `GameMenuView` and sets the tab bar appearance:
- **GameMenuView**: Central navigation for the game.
- **Background Color**: Sets up the default background color to enhance the game's visual style.

---

### SpacematicApp.swift

Defines the app's lifecycle and initializes the SQLite database for storing scores. Includes methods to create, insert, and update tables for game data.
- **AppDelegate**: Manages database creation and updates using SQLite.
- **Database Functions**: Saves high scores, tracks game modes, and updates scores when new high scores are reached.

---

### BackgroundMusicManager.swift

Handles background music for Spacematic, using `AVAudioPlayer` to manage audio playback:
- **Start and Stop Music**: Begins playback when the game starts and stops when the app moves to the background.
- **Adjust Playback Speed**: Enables playback rate changes for specific effects during gameplay.
- **Audio Session Setup**: Configures `AVAudioSession` for optimal audio playback experience.

---

## Getting Started

### Prerequisites

- **Xcode**: Version 12.0 or higher.
- **Swift**: Version 5.3 or higher.
- **iOS Device/Simulator**: iOS 14.0 or higher for optimal performance.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/spacematic.git

