//
//  ViewController.swift
//  Login
//
//  Created by Wolfpack Digital on 21.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var forgotUsernameButton: UIButton!
    
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        
        if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUsernameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title = usernameTextField.text
        }

    }


    @IBAction func forgotUsernameTapped(_ sender: Any) {
        performSegue(withIdentifier: "LoginToLanding",
           sender: forgotUsernameButton)

    }
    
    
    @IBAction func forgotPassword(_ sender: Any) {
        performSegue(withIdentifier: "LoginToLanding",
           sender: forgotPasswordButton)
    }
}

