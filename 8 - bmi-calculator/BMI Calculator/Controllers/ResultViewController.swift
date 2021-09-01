//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Virtual Machine on 01/09/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmiValue: String?
    var bmiAdvice: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = bmiValue
        adviceLabel.text = bmiAdvice
        self.view.backgroundColor = bmiColor
        // Do any additional setup after loading the view.
    }

    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
