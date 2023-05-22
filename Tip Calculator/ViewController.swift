//
//  ViewController.swift
//  Tip Calculator
//
//  Created by 7g on 3/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    var value:Int = 0
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var BobLegertTheRed: UIView!
    @IBOutlet weak var Slider: UISlider!
    
    @IBOutlet weak var SplitPeople: UIStepper!
    @IBOutlet weak var SubTotalBeforeTax: UITextField!
    @IBOutlet weak var BobLegertTheRedBottom: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BobLegertTheRed.layer.cornerRadius = 23
        SplitPeople.minimumValue = 1
        SplitPeople.maximumValue = 10
        SplitPeople.stepValue = 1
        SplitPeople.value = 1
        SplitPeople.layer.cornerRadius = 5
        BobLegertTheRedBottom.layer.cornerRadius = 23
        Slider.isHidden = true
        segmentedControl.selectedSegmentIndex = 4
        value = 0
        SliderValueChange.text = "0%"
        darkModeSwitch.isOn = false
        Slider.tintColor = .black
    }
    
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 3 {
            Slider.isHidden = false
        } else {
            Slider.isHidden = true
        }
        if sender.selectedSegmentIndex == 0 {
            SliderValueChange.text = "15%"
            value = 15
        }
        else if sender.selectedSegmentIndex == 1 {
            SliderValueChange.text = "18%"
            value = 18
        }
        else if sender.selectedSegmentIndex == 2{
            SliderValueChange.text = "20%"
            value = 20
        }
        else if sender.selectedSegmentIndex == 3{
            Slider.value = Float(value)
            SliderValueChange.text = "\(Slider.value)%"
        }
    }
    @IBOutlet weak var SliderValueChange: UILabel!
    
    @IBAction func SliderValue(_ sender: UISlider) {
        SliderValueChange.text = "\(Int(sender.value))"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        SplitAmount.text = "\(stepperValue)"
    }
    @IBOutlet weak var SplitAmount: UILabel!
    
    @IBAction func Reset(_ sender: Any) {
    }
    
    @IBOutlet weak var Calculate: UIButton!
    @IBOutlet weak var subTotal: UILabel!
    @IBAction func calculateTip(_ sender: Any) {
        if let subtotal = Double(SubTotalBeforeTax.text ?? ""), let tipPercent = Double(SliderValueChange.text ?? "") {
                let tipAmount = subtotal * tipPercent / 100
                
                
                updateTotal()
            }
        }

    
    
        func updateTotal() {
            guard let BeforeTip = Double(SubTotalBeforeTax.text ?? ""),
                  let tipAmount else {
                return
            }
            let total = BeforeTip + tipAmount
            
            subTotal.text = String(format: "%.2f", total)
        }
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBAction func switchDidChange(_ sender: UISwitch) { if sender.isOn {
        
        // Set background color to black
        UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = .dark
        }
        // Set label colors to white
        for label in self.view.subviews.compactMap({ $0 as? UILabel }) {
            label.textColor = .white
            SubTotalBeforeTax.backgroundColor = .white
            Slider.tintColor = .white
            
        }
        
        Calculate.titleLabel?.textColor = .white
        Calculate.tintColor = .white
    } else {
        // Set background color to light
        UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = .light
        }
        // Set label colors to black
        for label in self.view.subviews.compactMap({ $0 as? UILabel }) {
            label.textColor = .black
            Slider.tintColor = .black
        }
    }
    
}
        
    }

