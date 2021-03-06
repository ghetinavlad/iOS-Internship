//
//  EmojiTableViewController.swift
//  EmojiTableViewController
//
//  Created by Wolfpack Digital on 28.07.2021.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis: [Emoji] = [
       Emoji(symbol: "π", name: "Grinning Face",description: "A typical smiley face.", usage: "happiness"),
       Emoji(symbol: "π", name: "Confused Face",description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
       Emoji(symbol: "π", name: "Heart Eyes",description: "A smiley face with hearts for eyes.",usage: "love of something; attractive"),
       Emoji(symbol: "π§βπ»", name: "Developer",
       description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).",
       usage: "apps, software,programming"),
       Emoji(symbol: "π’", name: "Turtle", description:
       "A cute turtle.", usage: "something slow"),
       Emoji(symbol: "π", name: "Elephant", description:
       "A gray elephant.", usage: "good memory"),
       Emoji(symbol: "π", name: "Spaghetti",
       description: "A plate of spaghetti.", usage: "spaghetti"),
       Emoji(symbol: "π²", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
       Emoji(symbol: "βΊοΈ", name: "Tent", description: "A small tent.", usage: "camping"),
       Emoji(symbol: "π", name: "Stack of Books",
       description: "Three colored books stacked on each other.",
       usage: "homework, studying"),
       Emoji(symbol: "π", name: "Broken Heart",
       description: "A red, broken heart.", usage: "extreme sadness"), Emoji(symbol: "π€", name: "Snore",
       description:
       "Three blue \'z\'s.", usage: "tired, sleepiness"),
       Emoji(symbol: "π", name: "Checkered Flag",
       description: "A black-and-white checkered flag.", usage:
       "completion")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> UITableViewController? {
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            // Editing Emoji
            let emojiToEdit = emojis[indexPath.row]
            return AditEditEmojiTableViewController(coder: coder,
               emoji: emojiToEdit)
        } else {
            // Adding Emoji
            return AditEditEmojiTableViewController(coder: coder,
               emoji: Emoji(symbol: "", name: "", description: "", usage: ""))
        }
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        Β 
        tableView.setEditing(!tableViewEditingMode, animated: true)

    }
    
    @IBAction func unwindToEmojiTableView(_ unwindSegue: UIStoryboardSegue) {
        // Use data from the view controller which initiated the unwind segue
        guard unwindSegue.identifier == "saveUnwind",
                let sourceViewController = unwindSegue.source
                   as? AditEditEmojiTableViewController,
                let emoji = sourceViewController.emoji else { return }
        Β 
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                emojis[selectedIndexPath.row] = emoji
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: emojis.count, section: 0)
                emojis.append(emoji)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        let emoji = emojis[indexPath.row]

        // Configure the cell...
        
        cell.update(with: emoji)
        
        cell.showsReorderControl = true

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.row]
        //print(emoji.symbol)
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
