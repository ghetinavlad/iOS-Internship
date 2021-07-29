//
//  FoodTableViewController.swift
//  FoodTableViewController
//
//  Created by Wolfpack Digital on 28.07.2021.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var firstFood = Food(name: "Egg", description: "good")
    var secondFood = Food(name: "Meat", description: "medium")
    var thirdFood = Food(name: "Vegetables", description: "bad")
    
    var mealsObj = mealList().createMeal
    
    func initData(){
    mealsObj[0].food.append(firstFood)
    mealsObj[0].food.append(secondFood)
    mealsObj[0].food.append(thirdFood)
    mealsObj[1].food.append(firstFood)
    mealsObj[1].food.append(secondFood)
    mealsObj[2].food.append(thirdFood)
    mealsObj[2].food.append(firstFood)
    mealsObj[2].food.append(secondFood)
    mealsObj[2].food.append(thirdFood)
    }
                                    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        //print(mealsObj)
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return mealsObj.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mealsObj[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        
        let meal = mealsObj[indexPath.section]
        let food = mealsObj[indexPath.section].food[indexPath.row]
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mealsObj[section].name
    }
    

}
