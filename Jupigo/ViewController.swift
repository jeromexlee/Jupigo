//
//  ViewController.swift
//  Jupigo
//
//  Created by XINHAO LI on 2/12/17.
//  Copyright © 2017 XINHAO LI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

  @IBOutlet weak var colorText: UITextField!
  
  let color = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]
  let picker = UIPickerView()
  let myColor : UIColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1.0)
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    picker.delegate = self
    picker.dataSource = self
    colorText.text = "Select Color"
    colorText.borderStyle = .line
    colorText.layer.borderWidth = 2
    colorText.layer.borderColor = myColor.cgColor
    // binding textfield to picker
    colorText.inputView = picker
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  

  public func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return color.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return color[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    colorText.text = color[row]
    self.view.endEditing(false)
  }
  

}

