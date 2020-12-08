//
//  MenuUi.swift
//  NoteAppUI
//
//  Created by стас on 17.11.2020.
//  Copyright © 2020 стас. All rights reserved.
//
import SideMenu
import UIKit
class MenuViewController: UITableViewController{
    
    var items = ["Work","Home","Pepole","Documents","Health and Sport","Finance","other",]
    var categoryForUI = Note()
        override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // do something
        switch categoryForUI.category {
            case .work:
                
            break
            case .home:
                break
            case .pepole:
                break
            case .documents:
                break
            case .helfAndSport:
                break
            case .finance:
                break
            case .other :
                break
            default: break
            
        }
        
    }
    
}
