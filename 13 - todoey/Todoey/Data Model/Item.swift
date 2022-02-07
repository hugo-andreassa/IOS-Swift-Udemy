//
//  Item.swift
//  Todoey
//
//  Created by Hugo Andreassa Amaral (P) on 07/02/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class Item {
    var title: String = ""
    var done: Bool = false
    
    init(_ title: String, done: Bool = false) {
        self.title = title
        self.done = done
    }
}
