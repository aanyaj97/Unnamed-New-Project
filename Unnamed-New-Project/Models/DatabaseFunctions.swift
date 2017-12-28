//
//  DatabaseAccess.swift
//  Unnamed-New-Project
//
//  Created by Aanya Jhaveri on 12/27/17.
//  Copyright © 2017 Aanya Jhaveri. All rights reserved.
//

import Foundation
import SQLite

let id = Expression<Int64>("id")
let name = Expression<String>("name")
    
let pieces = Table("pieces")


func establishConnection() -> Connection {
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
        ).first!
    let db = try! Connection("\(path)/closetpieces.sqlite")
    return db
}
 
func createNewTable(connection: Connection) {
    do {
        try connection.run(pieces.create(ifNotExists: true){ t in
            t.column(id, primaryKey: true)
            t.column(name)
        })
    }
    catch {
        print("\(error)")
    }
}

func addNewItem(nameOfItem: String, connection: Connection, table: Table) {
    do {
        try connection.run(table.insert(name <- nameOfItem))
    } catch {
        print("\(error)")
    }
}

func retrieveAllValues(connection: Connection, table: Table) {
    for item in try! connection.prepare(table) {
        print("id: \(item[id]), name: \(item[name])")
    }
}











