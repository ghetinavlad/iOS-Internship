//
//  AthleteFormViewController.swift
//  AthleteFormViewController
//
//  Created by Wolfpack Digital on 23.07.2021.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var leagueTextField: UITextField!
    
    @IBOutlet weak var teamTextField: UITextField!
    
    
    var athlete: Athlete?
    
    init?(coder: NSCoder, athlete: Athlete) {
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
   
    
    func updateView(){
        if athlete != nil{
            if athlete is Athlete{
                nameTextField.text = athlete?.name
                let ageToString = String(athlete!.age)
                ageTextField.text = ageToString
                leagueTextField.text = athlete?.league
                teamTextField.text = athlete?.league
            }
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let name = nameTextField.text,
            let ageString = ageTextField.text,
            let age = Int(ageString),
            let league = leagueTextField.text,
            let team = teamTextField.text else {return}
         
            athlete = Athlete(name: name, age: age, league: league,
            team: team)
        
        performSegue(withIdentifier: "goBack", sender: self)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
