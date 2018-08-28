//
//  ViewController.swift
//  Test
//
//  Created by jason on 8/27/18.
//  Copyright © 2018 Lan Yang. All rights reserved.
//

import UIKit
enum modes {
    case empty
    case addition
    case subtraction
    case multiplication
    case division
}
class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var labelString:String = "0"
    var currentMode:modes = .empty
    var savedNum:Double = 0
    var lastButtonWasMode:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressDivision(_ sender: Any) {
        changeModes(newMode: .division)
        
    }
    
    @IBAction func pressMultiplication(_ sender: Any) {
        changeModes(newMode: .multiplication)
    }
    
    
    @IBAction func pressSubtraction(_ sender: Any) {
        changeModes(newMode: .subtraction)
    }
    
    @IBAction func pressAddition(_ sender: Any) {
        changeModes(newMode: .addition)
    }
    @IBAction func pressEqual(_ sender: Any) {
        
        guard let labelDouble:Double = Double(labelString) else {
            return
        }
        if(currentMode == .empty || lastButtonWasMode == true){
            return
        }
        if(currentMode == .addition){
            savedNum += labelDouble
        }
        else if(currentMode == .subtraction){
            savedNum -= labelDouble
        }
        else if(currentMode == .multiplication){
            savedNum *= labelDouble
        }
        else if(currentMode == .division){
            savedNum /= labelDouble
        }
        
        currentMode = .empty
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
        
    }
    @IBAction func pressClear(_ sender: Any) {
         labelString = "0"
         currentMode = .empty
         savedNum = 0
         lastButtonWasMode = false
         label.text="0"
        
        
    }
    @IBAction func pressNumber(_ sender: UIButton) {
        var stringValue:String? = sender.titleLabel?.text
        
        if(lastButtonWasMode==true){
            lastButtonWasMode = false
            labelString = "0"
        }
        
        
        labelString=labelString.appending(stringValue!)
        updateText()
    }
    
    func updateText(){
        guard let labelDouble:Double = Double(labelString) else {
            return
        }
        
        if(currentMode == .empty){
            savedNum = labelDouble
        }
        
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let num:NSNumber = NSNumber(value : labelDouble)
        
        
        
        label.text=formatter.string(from: num)
    }
    
    func changeModes(newMode:modes){
        if(savedNum==0){
            return
        }
        
        currentMode=newMode
        lastButtonWasMode=true
        
    }

}

