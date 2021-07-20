//
//  ViewController.swift
//  Light
//
//  Created by Wolfpack Digital on 19.07.2021.
//

import UIKit

class ViewController: UIViewController {

    var lightOn = true
    
    //@IBOutlet weak var lightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    fileprivate func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()

        
    }
}

