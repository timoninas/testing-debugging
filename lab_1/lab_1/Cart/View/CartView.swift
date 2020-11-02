//
//  CartView.swift
//  lab_1
//
//  Created by Антон Тимонин on 02.11.2020.
//

import UIKit

class CartView: UIViewController {

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
        navigationItem.title = "Your cart"
        self.view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    }
}
