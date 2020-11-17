//
//  NotesTableViewController.swift
//  NoteAppUI
//
//  Created by стас on 16.10.2020.
//  Copyright © 2020 стас. All rights reserved.
//
//Class for UITableViewController
import UIKit


class NotesTableViewController: UITableViewController , EditNoteDelegate{
   
    var data = DataManager()
    
    //Button to add notes
    @IBAction  private func addNoteButtonTapped(_ sender: UIBarButtonItem) {
        let note = ["title": "", "body": ""]
        data.notes.insert(note, at: 0)
        self.tableView.reloadData()
        self.selectIndex = 0
        performSegue(withIdentifier: "ShowEditScreenSegue", sender: nil)
    }
    //An Array of dictionaris whitch string key and string value
    // Keys="title","body"
 
    private var selectIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.self.readNotes()
       
    }
    
    @IBOutlet var menu: UICommand!
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //Return number of rows in each section
    override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.self.notes.count
    }

    // Configure the cell...
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        cell.textLabel?.text=data.self.notes[indexPath.row]["title"]
        return cell
    }
    //move to EditNotes view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectIndex = indexPath.row
        performSegue(withIdentifier: "ShowEditScreenSegue", sender: nil)
    }
    //EditingStyle delet cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if  editingStyle == .delete{
            data.self.notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            data.saveNotes()
        }
    }
//    update notes on the table view and body
    func updateNote(updateTitle: String, updateBody: String) {
        data.self.notes[selectIndex]["title"] = updateTitle
        data.self.notes[selectIndex]["body"] = updateBody
        self.tableView.reloadData()
        data.self.saveNotes()
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destinationVc = segue.destination as? EditNoteViewController
        destinationVc?.title = data.self.notes[selectIndex]["title"]
        destinationVc?.noteBody = data.self.notes[selectIndex]["body"]
        destinationVc?.editNoteDelegate = self
    }
    


}
