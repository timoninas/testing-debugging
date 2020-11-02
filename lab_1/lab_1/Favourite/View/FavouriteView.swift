//
//  FavouriteView.swift
//  lab_1
//
//  Created by Антон Тимонин on 02.11.2020.
//

import UIKit

class FavouriteView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layout()
    }
    
    func setup() {
        
    }
    
    func layout() {
        navigationItem.title = "Favourite"
        self.view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
}
