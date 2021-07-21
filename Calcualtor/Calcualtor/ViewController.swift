//
//  ViewController.swift
//  Calcualtor
//
//  Created by Wolfpack Digital on 21.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var operation: UILabel!
    
    var result = 0
    var op1 = 0
    var op2 = 0
    var oprt = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func button1(_ sender: Any) {
        if(label.text != "0"){
            label.text! += "1"
        }
        else{
            label.text! = "1"
        }
    }
    
    @IBAction func button2(_ sender: Any) {
        if(label.text != "0"){
            label.text! += "2"
        }
        else{
            label.text! = "2"
        }
    }
    
    @IBAction func button3(_ sender: Any) {
        if(label.text != "0"){
            label.text! += "3"
        }
        else{
            label.text! = "3"
        }
    }
    
    @IBAction func button4(_ sender: Any) {
        if(label.text != "0"){
            label.text! += "4"
        }
        else{
            label.text! = "4"
        }
    }
    
    @IBAction func button5(_ sender: Any) {
        if(label.text != "0"){
            label.text! += "5"
        }
        else{
            label.text! = "5"
        }
    }
    
    @IBAction func button6(_ sender: Any) {
        if(label.text != "0"){
            label.text! += "6"
        }
        else{
            label.text! = "6"
        }
    }
    
    
    @IBAction func button7(_ sender: Any) {
        if(label.text != "0"){
            label.text! += "7"
        }
        else{
            label.text! = "7"
        }
    }
    
    
    @IBAction func button8(_ sender: Any) {
        if(label.text != "0"){
            label.text! += "8"
        }
        else{
            label.text! = "8"
        }
    }
    
    
    @IBAction func button9(_ sender: Any) {
        if(label.text != "0"){
            label.text! += "9"
        }
        else{
            label.text! = "9"
        }
    }
    
    @IBAction func buttonC(_ sender: Any) {
        label.text = "0"
        op1 = 0
        op2 = 0
        operation.text = ""
    }
    
    
    @IBAction func buttonPlus(_ sender: Any) {
        op1 = Int(label.text!) ?? 0
        label.text = ""
        oprt = "+"
        operation.text = oprt
    }
    
    @IBAction func buttonMinus(_ sender: Any) {
        op1 = Int(label.text!) ?? 0
        label.text = ""
        oprt = "-"
        operation.text = oprt
    }
    
    
    @IBAction func buttonMultiplication(_ sender: Any) {
        op1 = Int(label.text!) ?? 0
        label.text = ""
        oprt = "x"
        operation.text = oprt
        
    }
    

    @IBAction func division(_ sender: Any) {
        op1 = Int(label.text!) ?? 0
        label.text = ""
        oprt = "/"
        operation.text = oprt
    }
    
    @IBAction func modulo(_ sender: Any) {
        op1 = Int(label.text!) ?? 0
        label.text = ""
        oprt = "%"
        operation.text = oprt
    }
    
    @IBAction func buttonEqual(_ sender: Any) {
        op2 = Int(label.text!) ?? 0
        if(oprt == "+"){
            label.text = String(op1 + op2)
        }
        else if(oprt == "-"){
            label.text = String(op1-op2)
        }
        else if(oprt == "x"){
            label.text = String(op1*op2)
        }
        else if(oprt == "/"){
            if(op2 != 0){
                label.text = String(op1/op2)
            }
            else{
                label.text = "error"
            }
        }
        else if(oprt == "%"){
            if(op2 != 0){
                label.text = String(op1%op2)
            }
            else{
                label.text = "error"
            }
        }
        
    }
    
}

