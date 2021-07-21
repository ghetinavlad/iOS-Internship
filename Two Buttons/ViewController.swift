//
//  ViewController.swift
//  Two Buttons
//
//  Created by Wolfpack Digital on 21.07.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setTextButtonTapped(_ sender: Any) {
        label.text = textField.text
    }
    
    @IBAction func cleaTextButtonTapped(_ sender: Any) {
        textField.text = ""
        label.text = ""
    }
}

