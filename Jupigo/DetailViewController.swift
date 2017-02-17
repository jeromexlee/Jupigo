//
//  DetailViewController.swift
//  Jupigo
//
//  Created by XINHAO LI on 2/12/17.
//  Copyright © 2017 XINHAO LI. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var colorText: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    var task : Task? = nil
    override func viewDidLoad() {
      super.viewDidLoad()
      // Init text field
      colorText.text = task?.color
      dateTime.text = task?.time
    }
  

}
