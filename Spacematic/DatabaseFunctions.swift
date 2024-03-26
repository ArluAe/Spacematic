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

func update(score: Int32) {
    let updateStatementString = "UPDATE Data SET BestScore = \(score);"
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

func select() -> Int? {
    let querySql = "SELECT BestScore FROM Data;"
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









func generateProblem(difficulty: String, score: Int) -> (String, Int, Int) {
    var signs = ["+"].randomElement()
    var problem = ("0 + 0", 0, 0)
    var playerScore = 1
    
    var value1 = 0
    var value2 = 0
    var value3 = 0
    
    switch difficulty {
        
    case "easy":
        playerScore = 1
        signs = ["+", "-", "x"].randomElement()
        switch signs {
        case "+":
            switch score {
            case 0...50:
                value1 = Int.random(in: 1...9)
                value2 = Int.random(in: 1...9)
            case 51...150:
                value1 = Int.random(in: 10...59)
                value2 = Int.random(in: 1...9)
            case 151...500:
                value1 = Int.random(in: 10...59)
                value2 = Int.random(in: 1...19)
            default:
                value1 = Int.random(in: 1...99)
                value2 = Int.random(in: 1...99)
            }
            problem = ("\(value1) + \(value2)", value1+value2, playerScore)
        case "-":
            switch score {
            case 0...50:
                value1 = Int.random(in: 10...19)
                value2 = Int.random(in: 1...9)
            case 51...150:
                value1 = Int.random(in: 10...59)
                value2 = Int.random(in: 1...9)
            case 151...500:
                value1 = Int.random(in: 20...59)
                value2 = Int.random(in: 1...19)
            default:
                value1 = Int.random(in: 60...99)
                value2 = Int.random(in: 1...59)
            }
            problem = ("\(value1) - \(value2)", value1-value2, playerScore)
        case "x":
            switch score {
            case 0...50:
                value1 = Int.random(in: 1...9)
                value2 = Int.random(in: 1...5)
            case 51...150:
                value1 = Int.random(in: 1...9)
                value2 = Int.random(in: 1...9)
            case 151...500:
                value1 = Int.random(in: 1...19)
                value2 = Int.random(in: 1...9)
            default:
                value1 = Int.random(in: 10...59)
                value2 = Int.random(in: 1...9)
            }
            problem = ("\(value1) x \(value2)", value1*value2, playerScore)
        default:
            problem =  ("0 + 0", 0, 0)
        }
        
    case "medium":
        playerScore = 3
        signs = ["+", "-", "x"].randomElement()
        switch signs {
        case "+":
            switch score {
            case 0...150:
                value1 = Int.random(in: 1...9)
                value2 = Int.random(in: 1...9)
                value3 = Int.random(in: 1...9)
            case 51...350:
                value1 = Int.random(in: 10...19)
                value2 = Int.random(in: 1...19)
                value3 = Int.random(in: 1...19)
            case 151...1500:
                value1 = Int.random(in: 10...59)
                value2 = Int.random(in: 10...19)
                value3 = Int.random(in: 1...19)
            default:
                value1 = Int.random(in: 10...59)
                value2 = Int.random(in: 10...59)
                value3 = Int.random(in: 10...59)
            }
            problem = ("\(value1) + \(value2) + \(value3)", value1+value2+value3, playerScore)
        case "-":
            switch score {
            case 0...150:
                value1 = Int.random(in: 19...59)
                value2 = Int.random(in: 1...9)
                value3 = Int.random(in: 1...9)
            case 51...350:
                value1 = Int.random(in: 29...59)
                value2 = Int.random(in: 10...19)
                value3 = Int.random(in: 1...9)
            case 151...1500:
                value1 = Int.random(in: 39...59)
                value2 = Int.random(in: 10...19)
                value3 = Int.random(in: 10...19)
            default:
                value1 = Int.random(in: 59...99)
                value2 = Int.random(in: 20...29)
                value3 = Int.random(in: 20...29)
            }
            
            problem = ("\(value1) - \(value2) - \(value3)", value1-value2-value3, playerScore)
        case "x":
            switch score {
            case 0...150:
                value1 = Int.random(in: 1...19)
                value2 = Int.random(in: 1...9)
            case 51...350:
                value1 = Int.random(in: 10...19)
                value2 = Int.random(in: 1...9)
            case 151...1500:
                value1 = Int.random(in: 10...59)
                value2 = Int.random(in: 1...19)
            default:
                value1 = Int.random(in: 10...99)
                value2 = Int.random(in: 10...59)
            }
            
            problem = ("\(value1) x \(value2)", value1*value2, playerScore)
            /*case "÷":
             value1 = Int.random(in: 1...9)
             value2 = Int.random(in: 1...9)
             problem = ("\(value1*value2) ÷ \(value2)", (value1*value2)/value2, playerScore)*/
        default:
            problem =  ("0 + 0", 0, 0)
        }
        
    case "hard":
        playerScore = 5
        signs = ["+", "-", "x", "complex"].randomElement()
        switch signs {
        case "+":
            
            switch score {
            case 0...250:
                value1 = Int.random(in: 10...19)
                value2 = Int.random(in: 10...19)
                value3 = Int.random(in: 10...19)
            case 51...750:
                value1 = Int.random(in: 10...59)
                value2 = Int.random(in: 10...19)
                value3 = Int.random(in: 10...19)
            case 151...2500:
                value1 = Int.random(in: 10...99)
                value2 = Int.random(in: 10...59)
                value3 = Int.random(in: 10...19)
            default:
                value1 = Int.random(in: 10...99)
                value2 = Int.random(in: 10...99)
                value3 = Int.random(in: 10...59)
            }
            
            problem = ("\(value1) + \(value2) + \(value3)", value1+value2+value3, playerScore)
        case "-":
            switch score {
            case 0...250:
                value1 = Int.random(in: 20...39)
                value2 = Int.random(in: 1...10)
                value3 = Int.random(in: 1...9)
            case 51...750:
                value1 = Int.random(in: 40...59)
                value2 = Int.random(in: 1...20)
                value3 = Int.random(in: 1...19)
            case 151...2500:
                value1 = Int.random(in: 60...79)
                value2 = Int.random(in: 10...30)
                value3 = Int.random(in: 10...29)
            default:
                value1 = Int.random(in: 60...99)
                value2 = Int.random(in: 10...30)
                value3 = Int.random(in: 10...29)
            }
            
            problem = ("\(value1) - \(value2) - \(value3)", value1-value2-value3, playerScore)
        case "x":
            switch score {
            case 0...250:
                value1 = Int.random(in: 10...19)
                value2 = Int.random(in: 1...19)
                
            case 51...750:
                value1 = Int.random(in: 10...59)
                value2 = Int.random(in: 10...19)
                
            case 151...2500:
                value1 = Int.random(in: 10...59)
                value2 = Int.random(in: 10...59)
                
            default:
                value1 = Int.random(in: 29...99)
                value2 = Int.random(in: 29...99)
                
            }
            problem = ("\(value1) x \(value2)", value1*value2, playerScore)
            /*case "÷":
             value1 = Int.random(in: 10...99)
             value2 = Int.random(in: 1...9)
             problem = ("\(value1*value2) ÷ \(value1)", (value1*value2)/value1, playerScore)
             case "square root":
             value1 = Int.random(in: 0...16)
             problem = ("√" + String(value1 * value1), value1, playerScore)*/
        case "complex":
            let complexSign = ["multiplication plus", "multiplication minus"].randomElement()!
            switch complexSign {
                
            case "multiplication plus":
                switch score {
                case 0...250:
                    value1 = Int.random(in: 10...19)
                    value2 = Int.random(in: 1...9)
                    value3 = Int.random(in: 10...19)
                case 51...750:
                    value1 = Int.random(in: 10...19)
                    value2 = Int.random(in: 10...19)
                    value3 = Int.random(in: 10...59)
                case 151...2500:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 10...19)
                    value3 = Int.random(in: 10...99)
                default:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 10...59)
                    value3 = Int.random(in: 10...99)
                }
                problem = (String(value1) + " x " + String(value2) + " + " + String(value3), value1 * value2 + value3, playerScore)
            case "multiplication minus":
                switch score {
                case 0...250:
                    value1 = Int.random(in: 10...19)
                    value2 = Int.random(in: 1...9)
                    value3 = Int.random(in: 1...9)
                case 51...750:
                    value1 = Int.random(in: 10...19)
                    value2 = Int.random(in: 10...19)
                    value3 = Int.random(in: 10...99)
                case 151...2500:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 10...19)
                    value3 = Int.random(in: 10...99)
                default:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 10...59)
                    value3 = Int.random(in: 10...99)
                }
                problem = (String(value1) + " x " + String(value2) + " - " + String(value3), value1 * value2 - value3, playerScore)
                /*case "division plus":
                 switch score {
                 case 0...250:
                 value1 = Int.random(in: 1...9)
                 value2 = Int.random(in: 1...9)
                 value3 = Int.random(in: 1...9)
                 case 51...750:
                 value1 = Int.random(in: 10...19)
                 value2 = Int.random(in: 1...19)
                 value3 = Int.random(in: 1...19)
                 case 151...2500:
                 value1 = Int.random(in: 10...59)
                 value2 = Int.random(in: 10...19)
                 value3 = Int.random(in: 1...19)
                 default:
                 value1 = Int.random(in: 10...59)
                 value2 = Int.random(in: 10...59)
                 value3 = Int.random(in: 10...59)
                 }
                 problem = (String(value1 * value2) + " ÷ " + String(value2) + " + " + String(value3), value1 + value3, playerScore)
                 case "division minus":
                 switch score {
                 case 0...250:
                 value1 = Int.random(in: 1...9)
                 value2 = Int.random(in: 1...9)
                 value3 = Int.random(in: 1...9)
                 case 51...750:
                 value1 = Int.random(in: 10...19)
                 value2 = Int.random(in: 1...19)
                 value3 = Int.random(in: 1...19)
                 case 151...2500:
                 value1 = Int.random(in: 10...59)
                 value2 = Int.random(in: 10...19)
                 value3 = Int.random(in: 1...19)
                 default:
                 value1 = Int.random(in: 10...59)
                 value2 = Int.random(in: 10...59)
                 value3 = Int.random(in: 10...59)
                 }
                 problem = (String(value1 * value2) + " ÷ " + String(value2) + " - " + String(value3), value1 - value3, playerScore)*/
            default:
                problem =  ("0 + 0", 0, 0)
            }
        default:
            problem =  ("0 + 0", 0, 0)
        }
    default:
        problem =  ("0 + 0", 0, 0)
    }
    return problem
}
