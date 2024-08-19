//
//  SpacematicApp.swift
//  Spacematic
//
//  Created by Charles-An on 04/02/2024.
//
// © 2024 Charles-Andrea GRAVIER. All rights reserved

import SwiftUI
import SQLite3



// OpaquePointer : Swift type for C pointers
var dbQueue: OpaquePointer!
// Variable to store the location of the SQLite DB.

var dataBaseURL = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        dbQueue = createAndOpenDataBase()
        
        if (createTables() == false) {
            print("Error in creating tables")
        } else {
            
            print("Tables created")
            insert0(data: "BestScore")
            insert0(data: "BestScore2")
        }
        return true
        
        //GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func createAndOpenDataBase() -> OpaquePointer? {
        
        var dataBase: OpaquePointer?
        
        // Sets up the URL to the database
        let url = NSURL(fileURLWithPath: dataBaseURL)
        
        // name of the database
        if let pathComponent = url.appendingPathComponent("brainAppDatabase") {
            let filePath = pathComponent.path
            if sqlite3_open(filePath, &dataBase) == SQLITE_OK {
                print("Successfully opened the database at \(filePath)")
                return dataBase
            }
            else {
                print("Could not open the database")
            }
        }
        else {
            print("File path is not available")
        }
        
        return dataBase
    }
    
    func createTables() -> Bool {
        var bRetVal: Bool = false
        
        //let createTable = sqlite3_exec(dbQueue, "CREATE TABLE IF NOT EXISTS Data (BestScore INTEGER NULL, Score INTEGER NULL, Date TEXT NULL)", nil, nil, nil)
        let createTable = sqlite3_exec(dbQueue, "CREATE TABLE IF NOT EXISTS Data (BestScore INTEGER NULL, BestScore2 INTEGER NULL)", nil, nil, nil)
        if(createTable != SQLITE_OK) {
            print("Unable to create table")
            bRetVal = false
        } else {
            bRetVal = true
        }
        return bRetVal
    }

    func insert0(data: String) {
        let insertStatementString = "INSERT INTO Data (BestScore) VALUES (?);"
        let insertStatementString2 = "INSERT INTO Data (BestScore) VALUES (?);"
        var insertStatement: OpaquePointer?
        // 1
        if sqlite3_prepare_v2(dbQueue, insertStatementString, -1, &insertStatement, nil) ==
            SQLITE_OK {
            let minScore: Int32 = 0
            sqlite3_bind_int(insertStatement, 1, minScore)

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("\nSuccessfully inserted row.")
            } else {
                print("\nCould not insert row.")
            }
        } else {
            print("\nINSERT statement is not prepared.")
        }
        sqlite3_finalize(insertStatement)
        
        if sqlite3_prepare_v2(dbQueue, insertStatementString2, -1, &insertStatement, nil) ==
            SQLITE_OK {
            let minScore: Int32 = 0
            sqlite3_bind_int(insertStatement, 1, minScore)

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("\nSuccessfully inserted row.2")
            } else {
                print("\nCould not insert row.2")
            }
        } else {
            print("\nINSERT statement is not prepared.2")
        }
        sqlite3_finalize(insertStatement)
    }
}


@main
struct MathemaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        
        WindowGroup {
            
            ContentView().onAppear {
                BackgroundMusicManager.shared.startBackgroundMusic()
            }
        }
    }
}


