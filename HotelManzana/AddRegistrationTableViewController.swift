//
//  AddRegistrationTableViewController.swift
//  AddRegistrationTableViewController
//
//  Created by Wolfpack Digital on 31.07.2021.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
        func selectRoomTypeTableViewController(_ controller:
           SelectRoomTypeTableViewController, didSelectType roomType:
           RoomType) {
            self.roomType = roomType
            updateRoomType()
        }
    
    
    var roomType: RoomType?
    
    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return dateFormatter
    }()
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
     
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatepicker.isHidden = !isCheckInDatePickerVisible
        }
    }
     
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    var registration: Registration? {
     
        guard let roomType = roomType else { return nil }
     
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatepicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
     
        return Registration(firstName: firstName,
                            lastName: lastName,
                            emailAddress: email,
                            checkInDate: checkInDate,
                            checkOutDate: checkOutDate,
                            numberOfAdults: numberOfAdults,
                            numberOfChildren: numberOfChildren,
                            wifi: hasWifi,
                            roomType: roomType
                            )
    }
    
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatepicker: UIDatePicker!
    
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    @IBOutlet weak var nrOfNightsLabel: UILabel!
    @IBOutlet weak var registrationDateIntervalLabel: UILabel!
    
    
    @IBOutlet weak var roomPriceLabel: UILabel!
    @IBOutlet weak var roomNameLabel: UILabel!
    
    
    
    @IBOutlet weak var wifiPriceLabel: UILabel!
    @IBOutlet weak var wifiIsOnLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
            roomNameLabel.text = roomType.name
            
            dateFormatter.dateFormat = "dd"
            let dayStart: String = dateFormatter.string(from: checkInDatepicker.date)
            let dayStartToInt = Int(dayStart) ?? 0
            let dayFinish: String = dateFormatter.string(from: checkOutDatePicker.date)
            let dayFinishToInt = Int(dayFinish) ?? 0
            let priceMul = Int(roomType.price) ?? 0
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let toStringText =  "$ \(String(priceMul*(dayFinishToInt-dayStartToInt+1)))"
            
            roomPriceLabel.text = toStringText
            
            var totalTextToString = priceMul*(dayFinishToInt-dayStartToInt+1)
            if wifiSwitch.isOn{
                totalTextToString += (dayFinishToInt-dayStartToInt + 1)*10
            }
            
            totalLabel.text = String(totalTextToString)
            
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    
    func updateDateViews(){
        checkInDateLabel.text = dateFormatter.string(from:
           checkInDatepicker.date)
        checkOutDateLabel.text = dateFormatter.string(from:
           checkOutDatePicker.date)
        
        dateFormatter.dateFormat = "dd"
        let dayStart: String = dateFormatter.string(from: checkInDatepicker.date)
        let dayStartToInt = Int(dayStart) ?? 0
        let dayFinish: String = dateFormatter.string(from: checkOutDatePicker.date)
        let dayFinishToInt = Int(dayFinish) ?? 0
        
        
        let textToString = "$ \(String((dayFinishToInt-dayStartToInt + 1)*10))"
        wifiPriceLabel.text = textToString
        
        nrOfNightsLabel.text = String(dayFinishToInt-dayStartToInt + 1)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let toStringText =  "\(checkInDateLabel.text!)\(" - ")\(checkOutDateLabel.text!)"
        registrationDateIntervalLabel.text = toStringText
        
        if let roomType = roomType {
            let priceMul = Int(roomType.price) ?? 0
            
        
        var totalTextToString = priceMul*(dayFinishToInt-dayStartToInt+1)
        if wifiSwitch.isOn{
            totalTextToString += (dayFinishToInt-dayStartToInt + 1)*10
        }
            totalLabel.text = String(totalTextToString)
        }
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper){
        updateNumberOfGuests()
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        if wifiSwitch.isOn{
            wifiIsOnLabel.text = "Yes"
        }
        else{
            wifiIsOnLabel.text = "No"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
        //print(checkInDateLabelCellIndexPath)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker){
        updateDateViews()
    }
    
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeController =
               SelectRoomTypeTableViewController(coder: coder)
            selectRoomTypeController?.delegate = self
            selectRoomTypeController?.roomType = roomType
        
        return selectRoomTypeController
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated:true, completion: nil)
    }
    /*@IBAction func doneBarButtonTapped(_ sender: Any) {
        let firstName = firstNameTextField.text ?? ""
            let lastName = lastNameTextField.text ?? ""
            let email = emailTextField.text ?? ""
            let checkInDate = checkInDatepicker.date
            let checkOutDate = checkOutDatePicker.date
            let numberOfAdults = Int(numberOfAdultsStepper.value)
            let numberOfChildren = Int(numberOfChildrenStepper.value)
            let hasWifi = wifiSwitch.isOn
         
            print("DONE TAPPED")
            print("firstName: \(firstName)")
            print("lastName: \(lastName)")
            print("email: \(email)")
            print("checkIn: \(checkInDate)")
            print("checkOut: \(checkOutDate)")
            print("numberOfAdults: \(numberOfAdults)")
            print("numberOfChildren: \(numberOfChildren)")
            print("wifi: \(hasWifi)")
    }
    */
    
    
    

    // MARK: - Table view data source
    
   /* override func tableView(_ tableView: UITableView,
       heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where
           isCheckInDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where
           isCheckOutDatePickerVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    */
    
    override func tableView(_ tableView: UITableView,
       didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
     
        if indexPath == checkInDateLabelCellIndexPath &&
           isCheckOutDatePickerVisible == false {
            
            isCheckInDatePickerVisible.toggle()
        } else if indexPath == checkOutDateLabelCellIndexPath &&
           isCheckInDatePickerVisible == false {
            
            isCheckOutDatePickerVisible.toggle()
        } else if indexPath == checkInDateLabelCellIndexPath ||
           indexPath == checkOutDateLabelCellIndexPath {
            
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible.toggle()
        } else {
            return
        }

        tableView.beginUpdates()
        tableView.endUpdates()
    }
    

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
     */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
