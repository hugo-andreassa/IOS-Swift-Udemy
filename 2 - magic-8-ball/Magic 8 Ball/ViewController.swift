//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImageView: UIImageView!
    
    let ballArray = [#imageLiteral(resourceName: "ball5"),#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball4"),#imageLiteral(resourceName: "ball4")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func askButtonPressed(_ sender: Any) {
        ballImageView.image = ballArray[Int.random(in: 0...5)]
    }
}

