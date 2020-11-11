//
//  EditNoteViewController.swift
//  NoteAppUI
//
//  Created by стас on 16.10.2020.
//  Copyright © 2020 стас. All rights reserved.
//
// class for TextEditing
import UIKit
//crate delegate
protocol EditNoteDelegate {
    func updateNote(updateTitle: String , updateBody: String)}

class EditNoteViewController: UIViewController,UITextViewDelegate {

    //dismiss the keyboar
    @IBAction private func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.bodyTextView.resignFirstResponder()
        self.doneButton.isEnabled = false
    
    }
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var bodyTextView: UITextView!
    //define delegate
    //will get updated titile and body
   var editNoteDelegate : EditNoteDelegate?
    var noteBody: String!
    
    //do any additional setup  after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bodyTextView.delegate = self
        self.bodyTextView.text = noteBody
        self.bodyTextView.becomeFirstResponder()
    }
    
    //grap updated titile and body 
    override  func viewWillDisappear(_ animated: Bool) {
        
        if self.editNoteDelegate != nil {
            self.editNoteDelegate?.updateNote(updateTitle: self.getNotesTitile(), updateBody: self.bodyTextView.text)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.doneButton.isEnabled = true
        
    }
//grap titile
// don't take empty lines
  private  func getNotesTitile() -> String{
        let components = self.bodyTextView.text.components(separatedBy: "\n")
        for components in components{
            if components.trimmingCharacters(in: CharacterSet.whitespaces).count > 0{
                return components
            }
        }
        return self.navigationItem.title ?? ""
    }
    
}
