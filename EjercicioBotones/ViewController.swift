//
//  ViewController.swift
//  EjercicioBotones
//
//  Created by Gonzalo Caniguan on 13-02-21.
//

import UIKit

class ViewController: UIViewController {

        //Outlets
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myStepperLabel: UILabel!
    @IBOutlet weak var mySwitchLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    
    //Variables
    private let myPickerViewValues = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Buttons
        myButton.setTitle("Mi Boton", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        //Picker
        myPicker.dataSource = self
        myPicker.delegate = self

        
        //PageControl
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .white
        myPageControl.pageIndicatorTintColor = .gray
        
        //SegmentedControl
        mySegmentedControl.removeAllSegments()
        for(index, value) in myPickerViewValues.enumerated(){
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        //mySlider
        mySlider.minimumTrackTintColor = .gray
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerViewValues.count)
        mySlider.value = 1
        
        //myStepper
        myStepper.minimumValue = 1
        myStepper.maximumValue = Double(myPickerViewValues.count)
        
        //mySwitch
        //mySwitch.onTintColor = .gray
        mySwitch.isOn = true;
        
        //myProgressView
        myProgressView.progress = 0
        
        myActivityIndicator.color = .white
        //myActivityIndicator.startAnimating()
        myActivityIndicator.hidesWhenStopped = true
        
        //label
        
        myStepperLabel.textColor = .white
        myStepperLabel.font = UIFont.boldSystemFont(ofSize: 16)
        myStepperLabel.text = "1.0"
        
        mySwitchLabel.textColor = .white
        mySwitchLabel.text = "Encendido"
        
        myTextField.placeholder = "Escribe algo"
        myTextField.delegate = self
        
        myTextView.isEditable = false
        
        
    }
    
    //Action
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue{
            myButton.backgroundColor = .green
        }else{
            myButton.backgroundColor = .blue
        }
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        let myPageControlValue = myPageControl.currentPage
        myPicker.selectRow(myPageControlValue, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[myPageControlValue]
        myButton.setTitle(myString, for: .normal)
        
        mySegmentedControl.selectedSegmentIndex = myPageControlValue
        
        mySlider.value = Float(myPageControlValue+1)
        
        myStepper.value = Double(myPageControlValue+1)
        
        if myPageControlValue == 0 {
            myProgressView.progress = (Float(myPageControlValue)*0.25)
        }else{
            myProgressView.progress = (Float(myPageControlValue)*0.25)
        }
        let number = Double(myPageControlValue+1)
        myStepperLabel.text = "\(number)"
        
    }
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        let mySegmentedValue = mySegmentedControl.selectedSegmentIndex
        myPicker.selectRow(mySegmentedValue, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[mySegmentedValue]
        myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = mySegmentedValue
        
        mySlider.value = Float(mySegmentedValue+1)
        
        myStepper.value = Double(mySegmentedValue+1)
        
        if mySegmentedValue == 0 {
            myProgressView.progress = (Float(mySegmentedValue)*0.25)
        }else{
            myProgressView.progress = (Float(mySegmentedValue)*0.25)
        }
        
        let number = Double(mySegmentedValue+1)
        myStepperLabel.text = "\(number)"
    }
    
    @IBAction func mySliderAction(_ sender: Any) {
        
        var progress: Float = 0

        switch mySlider.value {

        case 1:
            progress = 0
            myStepperLabel.text = "1.0"
        case 1..<2:
            mySegmentedControl.selectedSegmentIndex = 0
            myPicker.selectRow(0, inComponent: 0, animated: true)
            myPageControl.currentPage = 0
            let myString = myPickerViewValues[0]
            myButton.setTitle(myString, for: .normal)
            myStepper.value = 1
            progress = 0.2
            myStepperLabel.text = "1.0"
        case 2..<3:
            mySegmentedControl.selectedSegmentIndex = 1
            myPicker.selectRow(1, inComponent: 0, animated: true)
            myPageControl.currentPage = 1
            let myString = myPickerViewValues[1]
            myButton.setTitle(myString, for: .normal)
            myStepper.value = 2
            progress = 0.4
            myStepperLabel.text = "2.0"
        case 3..<4:
            mySegmentedControl.selectedSegmentIndex = 2
            myPicker.selectRow(2, inComponent: 0, animated: true)
            myPageControl.currentPage = 2
            let myString = myPickerViewValues[2]
            myButton.setTitle(myString, for: .normal)
            myStepper.value = 3
            progress = 0.6
            myStepperLabel.text = "3.0"
        case 4..<5:
            mySegmentedControl.selectedSegmentIndex = 3
            myPicker.selectRow(3, inComponent: 0, animated: true)
            myPageControl.currentPage = 3
            let myString = myPickerViewValues[3]
            myButton.setTitle(myString, for: .normal)
            myStepper.value = 4
            progress = 0.8
            myStepperLabel.text = "4.0"
        default:
            mySegmentedControl.selectedSegmentIndex = 4
            myPicker.selectRow(4, inComponent: 0, animated: true)
            myPageControl.currentPage = 4
            let myString = myPickerViewValues[4]
            myButton.setTitle(myString, for: .normal)
            myStepper.value = 5
            progress = 1
            myStepperLabel.text = "5.0"
        }
        
        myProgressView.progress = progress
    }
    
    @IBAction func myStepperAction(_ sender: Any) {
        
        let myStepperValue = myStepper.value
        mySlider.value = Float(myStepperValue)
        mySegmentedControl.selectedSegmentIndex = Int(myStepperValue)-1
        myPicker.selectRow(Int(myStepperValue)-1, inComponent: 0, animated: true)
        myPageControl.currentPage = Int(myStepperValue)-1
        let myString = myPickerViewValues[Int(myStepperValue)-1]
        myButton.setTitle(myString, for: .normal)
        
        if myStepperValue == 1 {
            myProgressView.progress = 0
        }else{
            myProgressView.progress = (Float(myStepperValue)*0.20)
        }
        
        myStepperLabel.text = "\(myStepperValue)"
        

    }
    
    @IBAction func mySwitchAction(_ sender: Any) {
        
        if mySwitch.isOn {
            myPicker.isHidden = false
            myButton.isHidden = false
            myStepper.isHidden = false
            mySlider.isHidden = false
            myPageControl.isHidden = false
            mySegmentedControl.isHidden = false
            myProgressView.isHidden = false
            myActivityIndicator.stopAnimating()
            myStepperLabel.isHidden = false
            mySwitchLabel.text = "Encendido"
            
        }else{
            myPicker.isHidden = true
            myButton.isHidden = true
            myStepper.isHidden = true
            mySlider.isHidden = true
            myPageControl.isHidden = true
            mySegmentedControl.isHidden = true
            myProgressView.isHidden = true
            myActivityIndicator.startAnimating()
            myStepperLabel.isHidden = true
            mySwitchLabel.text = "Apagado"
            
        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = row
        
        mySegmentedControl.selectedSegmentIndex = row
        
        mySlider.value = Float(row+1)
        
        myStepper.value = Double(row+1)

        if row == 0 {
            myProgressView.progress = (Float(row)*0.25)
        }else{
            myProgressView.progress = (Float(row)*0.25)
        }
        let number = Double(row+1)
        myStepperLabel.text = "\(number)"
    }
}

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myButton.setTitle(myTextField.text, for: .normal)
        myTextField.text = ""
    }
    
}
