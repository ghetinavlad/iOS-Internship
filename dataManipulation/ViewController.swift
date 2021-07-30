//
//  ViewController.swift
//  dataManipulation
//
//  Created by Wolfpack Digital on 29.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let newNote = Note(title: "Grocery run",
                       text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles.",
                       timestamp: Date())

    let propertyListEncoder = PropertyListEncoder()
    let propertyListDecoder = PropertyListDecoder()
    
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    func encodeDecodePList(){
        let encodedNote = try? propertyListEncoder.encode(newNote)
        let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
        try? encodedNote?.write(to: archiveURL, options: .noFileProtection)
        
        if let retrievedNoteData = try? Data(contentsOf: archiveURL),
            let decodedNote = try? propertyListDecoder.decode(Note.self,
               from: retrievedNoteData) {
            print(decodedNote)
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //print(newNote)
        encodeDecodePList()
        // Do any additional setup after loading the view.
    }


}

