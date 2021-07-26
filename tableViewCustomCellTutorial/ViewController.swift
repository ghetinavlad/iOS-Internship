//
//  ViewController.swift
//  tableViewCustomCellTutorial
//
//  Created by Wolfpack Digital on 26.07.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let myData = ["First", "Second", "Third", "Fourth" , "Fifth"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "DemoTableViewCell" , bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath)
        as! DemoTableViewCell
        
        
        cell.myLabel.text = myData[indexPath.row]
        cell.myImageView.backgroundColor = .red
        
        return cell
    }
    


}

