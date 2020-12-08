//
//  Note.swift
//  NoteAppUI
//
//  Created by стас on 14.11.2020.
//  Copyright © 2020 стас. All rights reserved.
//

import Foundation

class Note{
    var title = ""
    var body =  ""
    // get the current date and time
    let currentDateTime = Date()
    let category = NotesCategory (rawValue: "")
    
    
    
    
    
    
    
    
    
    
    func dateToString(currentDateTime: Date) -> String {

        let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.dateStyle = .long
        // get the date time String from the date object
        return formatter.string(from: currentDateTime)
    }
    
    
}
