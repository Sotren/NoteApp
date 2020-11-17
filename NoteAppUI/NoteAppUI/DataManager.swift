//
//  SaveData.swift
//  NoteAppUI
//
//  Created by стас on 14.11.2020.
//  Copyright © 2020 стас. All rights reserved.
//

import Foundation
class DataManager: NotesDictionary {
    
    //var notes = [[String:String]]()
    //Save notes use Ns userDefault
      func saveNotes(){
        UserDefaults.standard.setValue(self.notes, forKey: "notes")
        UserDefaults.standard.synchronize()
    }
    //read notes
     func readNotes() {
        if let newNotes =
            UserDefaults.standard.array(forKey: "notes") as? [[String:String]]{
        self.notes = newNotes
       }

        
        }
    }

