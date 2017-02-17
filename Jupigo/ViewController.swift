//
//  ViewController.swift
//  Jupigo
//
//  Created by XINHAO LI on 2/12/17.
//  Copyright © 2017 XINHAO LI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

  @IBOutlet weak var colorText: UITextField!
  @IBOutlet weak var postButton: UIButton!
  
  let color = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]
  let picker = UIPickerView()
  let myColor : UIColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1.0)
  let date = Date()
  let formatter = DateFormatter()
  let toolBar = UIToolbar()
  var index : Int = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    picker.delegate = self
    picker.dataSource = self
    
    // Init the color text field
    colorText.delegate = self
    colorText.text = ""
    colorText.borderStyle = .line
    colorText.layer.borderWidth = 1
    colorText.layer.borderColor = myColor.cgColor
    
    // Binding textfield to picker
    colorText.inputView = picker
    
    // Init psot button
    postButton.isEnabled = false
    
    // Init date format
    formatter.dateFormat = "MM/dd/yyyy hh:mm:ss"
    
    toolBar.sizeToFit()
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
    toolBar.setItems([flexibleSpace, doneButton], animated: false)
    
    colorText.inputAccessoryView = toolBar
    
  }
  
  func doneClicked() {
    view.endEditing(true)
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    postButton.isEnabled = true
    colorText.text = color[index]
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return color.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    index = row
    return color[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    colorText.text = color[row]
  }
  
  @IBAction func postNow(_ sender: Any) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let task = Task(context: context)
    
    task.color = colorText.text!
    task.time = formatter.string(from: date)
    
    
    // Save the data to coredata
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
    tabBarController?.selectedIndex = 1
  }

}

