//
//  MenuUi.swift
//  NoteAppUI
//
//  Created by стас on 17.11.2020.
//  Copyright © 2020 стас. All rights reserved.
//

import UIKit
class MenuViewController: UIViewController {
    
    var menu: sideMenuNavigationController?
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    
    }
    
    @IBAction func didTapMenu(_ sender: Any) {
        present(menu!, animated: ture)
    }
}
