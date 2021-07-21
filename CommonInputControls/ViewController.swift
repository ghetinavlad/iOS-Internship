//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Wolfpack Digital on 20.07.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var toggle: UISwitch!
    
    @IBOutlet weak var slider: UISlider!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.addTarget(self, action: #selector(buttonTapped(_:)),
           for: .touchUpInside) 
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Button was tapped")
        if toggle.isOn{
            print("The switch is on")
            slider.value = 0.2
        }
        else{
            print("The switch is off")
        }
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("The switch is on!")
        }
        else{
            print("The switch is off!")
        }
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text{
            print(text)
        }
    }
    
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text{
            print(text)
        }
    }
    
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in:view)
        print(location)
    }
    
    
}

