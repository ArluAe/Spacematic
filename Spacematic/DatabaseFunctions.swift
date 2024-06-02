//
//  DatabaseFunctions.swift
//  Spacematic
//
//  Created by Charles-An on 04/02/2024.
//
// © 2024 Charles-Andrea GRAVIER. All rights reserved

import Foundation
import SQLite3
/*
 /*func addDataScore(dbQueue: OpaquePointer!, score: Int, date: String) -> String! {
  let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
  // insert query
  let insertStatement = "INSERT INTO Data (Score, Date) VALUES (?, ?);"
  
  var insertStatementQuery: OpaquePointer?
  
  if (sqlite3_prepare_v2(dbQueue, insertStatement, -1, &insertStatementQuery, nil)) == SQLITE_OK {
  
  sqlite3_bind_int(dbQueue, 1, Int32(score))
  sqlite3_bind_text(insertStatementQuery, 2, date, -1, SQLITE_TRANSIENT)
  
  if (sqlite3_step(insertStatementQuery)) == SQLITE_DONE {
  print("success fully inserted the record")
  } else {
  print("error")
  }
  
  sqlite3_finalize(insertStatementQuery)
  }
  
  
  
  // select query
  
  let selectStatement = "SELECT TEMPCOLLUM1 FROM Data"
  
  var selectStatementQuery: OpaquePointer?
  
  var showData: String!
  
  showData = "0"
  if sqlite3_prepare_v2(dbQueue, selectStatement, -1, &selectStatementQuery, nil) == SQLITE_OK {
  while sqlite3_step(selectStatementQuery) == SQLITE_ROW {
  showData += String(cString: sqlite3_column_text(selectStatementQuery, 0)) + "\t\t";
  }
  
  sqlite3_finalize(selectStatementQuery)
  }
  
  return showData
  }
  
  func retrieveScore() {
  
  }
  
  func retrieveDateScore() {
  
  }*/
 
 func addDataBestScore(dbQueue: OpaquePointer!, bestScore: Int) {
 let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
 // insert query
 let insertStatement = "INSERT INTO Data (BestScore) VALUES (?);"
 
 var insertStatementQuery: OpaquePointer?
 
 if (sqlite3_prepare_v2(dbQueue, insertStatement, -1, &insertStatementQuery, nil)) == SQLITE_OK {
 
 sqlite3_bind_int(insertStatementQuery, 1, Int32(bestScore))
 
 if (sqlite3_step(insertStatementQuery)) == SQLITE_DONE {
 print("success fully inserted the record")
 } else {
 print("error")
 }
 
 sqlite3_finalize(insertStatementQuery)
 }
 
 }
 
 /*func prepareStatement(sql: String) throws -> OpaquePointer? {
  var statement: OpaquePointer?
  guard sqlite3_prepare_v2(dbQueue, sql, -1, &statement, nil)
  == SQLITE_OK else {
  return dbQueue
  }
  return statement
  }*/
 func retrieveBestScore(bestScore: Int) -> Int! {
 // select query
 
 let selectStatement = "SELECT bestScore FROM Data;"
 
 var selectStatementQuery: OpaquePointer?
 
 var showData: Int!
 
 showData = 0
 if sqlite3_prepare_v2(dbQueue, selectStatement, 0, &selectStatementQuery, nil) == SQLITE_OK {
 print("okkk")
 //while sqlite3_step(selectStatementQuery) == SQLITE_ROW {
 //showData += cString: sqlite3_column_text(selectStatementQuery, 0)) + "\t\t";
 //showData = Int(sqlite3_column_int(selectStatementQuery, 0))
 //showData = Int(sqlite3_column_int(selectStatementQuery, Int32(bestScore)))
 showData = Int(sqlite3_bind_int(selectStatementQuery, 0, Int32(bestScore)))
 print("ok")
 //}
 
 sqlite3_finalize(selectStatementQuery)
 }
 
 return showData
 
 /*let querySql = "SELECT * FROM Data;"
  guard let queryStatement = try? prepareStatement(sql: querySql) else {
  return nil
  }
  defer {
  sqlite3_finalize(queryStatement)
  }
  //guard sqlite3_bind_int(queryStatement, 1, id) == SQLITE_OK else {
  //  return nil
  //}
  guard sqlite3_step(queryStatement) == SQLITE_ROW else {
  return nil
  }
  let id = sqlite3_column_int(queryStatement, 0)
  
  return retrieveBestScore(bestScore: Int(id))*/
 }
 
 */

func prepareStatement(sql: String) throws -> OpaquePointer? {
    var statement: OpaquePointer?
    guard sqlite3_prepare_v2(dbQueue, sql, -1, &statement, nil)
            == SQLITE_OK else {
        print("fail !")
        return dbQueue
    }
    return statement
}

func update(score: Int32,gameMode:String) {
    var updateStatementString = "UPDATE Data SET BestScore = \(score);"
    if(gameMode == "maths") {
        updateStatementString = "UPDATE Data SET BestScore = \(score);"
    } else if (gameMode == "geography") {
        updateStatementString = "UPDATE Data SET BestScore2 = \(score);"
    }

    var updateStatement: OpaquePointer?
    if sqlite3_prepare_v2(dbQueue, updateStatementString, -1, &updateStatement, nil) ==
        SQLITE_OK {
        if sqlite3_step(updateStatement) == SQLITE_DONE {
            print("\nSuccessfully updated row.")
        } else {
            print("\nCould not update row.")
        }
    } else {
        print("\nUPDATE statement is not prepared")
    }
    sqlite3_finalize(updateStatement)
}

func select(gameMode: String) -> Int? {
    var querySql = "SELECT BestScore FROM Data;"
    if(gameMode == "maths") {
        querySql = "SELECT BestScore FROM Data;"
    } else if (gameMode == "geography") {
        querySql = "SELECT BestScore2 FROM Data;"
    }

    guard let queryStatement = try? prepareStatement(sql: querySql) else {
        return nil
    }
    defer {
        sqlite3_finalize(queryStatement)
    }
    /*guard sqlite3_bind_int(queryStatement, 1, Int32(score)) == SQLITE_OK else {
        return nil
    }*/
    guard sqlite3_step(queryStatement) == SQLITE_ROW else {
        return nil
    }
    let id = sqlite3_column_int(queryStatement, 0)

    return Int(id)
}
















